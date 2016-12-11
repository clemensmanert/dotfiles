function ev --description 'Tell a running emacs deamon to view the specified file'
  cat $argv ^/dev/null | while read -l line
    set argv $argv $line
  end

  test -z "$argv"; and return

  for i in $argv
      if test -f $i
      	 emacsclient --no-wait $i
      end
  end
end

