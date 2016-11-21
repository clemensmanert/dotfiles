function t --description 'Put stuff to trash'
  cat $argv ^/dev/null | while read -l line
    set argv $argv $line
  end

  test -z "$argv"; and return

  for i in $argv
      if test -f $i 
      	 trash $i
      end
  end 
end
