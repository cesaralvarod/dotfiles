if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
   fzf_key_bindings
end

function rmk
  echo $argv[1]
  scrub -p dod $argv[1]
  shred -zun 10 -v $argv[1]
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

starship init fish | source
