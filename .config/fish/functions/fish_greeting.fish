function fish_greeting
    set_color $fish_color_comment
    echo -n 'Welcome to '
    set_color normal
    echo -n (hostname)
    set_color $fish_color_comment
    echo -n ' en0: '
    set_color $fish_color_cwd
    echo (ipconfig getifaddr en0)
    set_color normal
end
