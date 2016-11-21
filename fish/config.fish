function fish_prompt

  z --add "$PWD"

  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end
  
  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end
    
    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end
    
    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '>'

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end


# initialize our new variables
# in theory this would be in a fish_prompt event, but this file isn't sourced
# until the fish_prompt function is called anyway.
if not set -q __prompt_initialized_2
  set -U fish_color_user -o green
  set -U fish_color_host -o cyan
  set -U fish_color_status red
  set -U __prompt_initialized_2
end

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

function z -d "Jump to a recent directory."
    set -l datafile "$HOME/.z"

    # add entries
    if [ "$argv[1]" = "--add" ]
        set -e argv[1]

        # $HOME isn't worth matching
        [ "$argv" = "$HOME" ]; and return

		set -l tempfile (mktemp $datafile.XXXXXX)
		test -f $tempfile; or return
		
        # maintain the file
        awk -v path="$argv" -v now=(date +%s) -F"|" '
            BEGIN {
                rank[path] = 1
                time[path] = now
            }
            $2 >= 1 {
                if( $1 == path ) {
                    rank[$1] = $2 + 1
                    time[$1] = now
                } else {
                    rank[$1] = $2
                    time[$1] = $3
                }
                count += $2
            }
            END {
                if( count > 1000 ) {
                    for( i in rank ) print i "|" 0.9*rank[i] "|" time[i] # aging
                } else for( i in rank ) print i "|" rank[i] "|" time[i]
            }
        ' $datafile ^/dev/null > $tempfile

        mv -f $tempfile $datafile

    # tab completion
    else
        if [ "$argv[1]" = "--complete" ]
            awk -v q="$argv[2]" -F"|" '
                BEGIN {
                    if( q == tolower(q) ) nocase = 1
                    split(q,fnd," ")
                }
                {
                    if( system("test -d \"" $1 "\"") ) next
                    if( nocase ) {
                        for( i in fnd ) tolower($1) !~ tolower(fnd[i]) && $1 = ""
                        if( $1 ) print $1
                    } else {
                        for( i in fnd ) $1 !~ fnd[i] && $1 = ""
                        if( $1 ) print $1
                    }
                }
            ' "$datafile" 2>/dev/null

        else
            # list/go
            set -l last ''
            set -l list 0
            set -l typ ''
            set -l fnd ''
            
            while [ (count $argv) -gt 0 ]
                switch "$argv[1]"
                    case -- '-h'
                        echo "z [-h][-l][-r][-t] args" >&2
                        return
                    case -- '-l'
                        set list 1
                    case -- '-r'
                        set typ "rank"
                    case -- '-t'
                        set typ "recent"
                    case -- '--'
                        while [ "$argv[1]" ]
                            set -e argv[1]
                            set fnd "$fnd $argv[1]"
                        end
                    case '*'
                        set fnd "$fnd $argv[1]"
                end
                set last $1
                set -e argv[1]
            end

            [ "$fnd" ]; or set list 1

            # if we hit enter on a completion just go there
            [ -d "$last" ]; and cd "$last"; and return

            # no file yet
            [ -f "$datafile" ]; or return

			set -l tempfile (mktemp $datafile.XXXXXX)
			test -f $tempfile; or return
            set -l target (awk -v t=(date +%s) -v list="$list" -v typ="$typ" -v q="$fnd" -v tmpfl="$tempfile" -F"|" '
                function frecent(rank, time) {
                    dx = t-time
                    if( dx < 3600 ) return rank*4
                    if( dx < 86400 ) return rank*2
                    if( dx < 604800 ) return rank/2
                    return rank/4
                }
                function output(files, toopen, override) {
                    if( list ) {
                        if( typ == "recent" ) {
                            cmd = "sort -nr >&2"
                        } else cmd = "sort -n >&2"
                        for( i in files ) if( files[i] ) printf "%-10s %s\n", files[i], i | cmd
                        if( override ) printf "%-10s %s\n", "common:", override > "/dev/stderr"
                    } else {
                        if( override ) toopen = override
                        print toopen
                    }
                }
                function common(matches, fnd, nc) {
                    for( i in matches ) {
                        if( matches[i] && (!short || length(i) < length(short)) ) short = i
                    }
                    if( short == "/" ) return
                    for( i in matches ) if( matches[i] && i !~ short ) x = 1
                    if( x ) return
                    if( nc ) {
                        for( i in fnd ) if( tolower(short) !~ tolower(fnd[i]) ) x = 1
                    } else for( i in fnd ) if( short !~ fnd[i] ) x = 1
                    if( !x ) return short
                }
                BEGIN { split(q, a, " ") }
                {
                    if( system("test -d \"" $1 "\"") ) next
                    print $0 >> tmpfl
                    if( typ == "rank" ) {
                        f = $2
                    } else if( typ == "recent" ) {
                        f = t-$3
                    } else f = frecent($2, $3)
                    wcase[$1] = nocase[$1] = f
                    for( i in a ) {
                        if( $1 !~ a[i] ) delete wcase[$1]
                        if( tolower($1) !~ tolower(a[i]) ) delete nocase[$1]
                    }
                    if( wcase[$1] > oldf ) {
                        cx = $1
                        oldf = wcase[$1]
                    } else if( nocase[$1] > noldf ) {
                        ncx = $1
                        noldf = nocase[$1]
                    }
                }
                END {
                    if( cx ) {
                        output(wcase, cx, common(wcase, a, 0))
                    } else if( ncx ) output(nocase, ncx, common(nocase, a, 1))
                }
            ' "$datafile")

            if [ $status -gt 0 ]
                rm -f "$tempfile"
            else
                mv -f "$tempfile" "$datafile"
                [ "$target" ]; and cd "$target"
            end
        end
    end
end	

function __z_init -d 'Set up automatic population of the directory list for z'
	functions fish_prompt | grep -q 'z --add'
	if [ $status -gt 0 ]
		functions fish_prompt | sed -e '$ i\\
		z --add "$PWD"' | .
	end
end

__z_init

# ssh-agent stuff
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set PATH /home/segfault/projekte/dotfiles/scripts $PATH
set PATH /home/segfault/projekte/dotfiles/links $PATH

set EDITOR "emacsclient --no-wait"
set USER segfault

