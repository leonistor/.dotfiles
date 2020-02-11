function fish_greeting
    set_color $fish_color_autosuggestion
    echo -n 'Welcome to '
    set_color normal
    echo -n (hostname)
    set_color $fish_color_autosuggestion
    echo -n ' en0: '
    set_color $fish_color_cwd
    echo -n (ipconfig getifaddr en0)
    set_color normal

    # mouse and keyboard battery alarm
    # https://nicolas-van.github.io/programming-with-fish-shell

    set platform (uname)
    switch $platform
        case Darwin
            # set BATT_ALARM_LEVEL 95
            set mouse_level (ioreg -c AppleDeviceManagementHIDEventService -r -l | grep -i mouse -A 20 | grep BatteryPercent | cut -d= -f2 | cut -d' ' -f2)
            set keybd_level (ioreg -c AppleDeviceManagementHIDEventService -r -l | grep -i keyboard -A 20 | grep BatteryPercent | cut -d= -f2 | cut -d' ' -f2)
            # if test (math "$keybd_level") -lt $BATT_ALARM_LEVEL
                # set_color $fish_color_error
                # echo 'Keyboard battery low!'
            # end
            switch $mouse_level
                case 1 2 3 4 5 6 7 8 9
                    set_color $fish_color_cwd_root
                    echo " Mouse battery low: $mouse_level%!"
                case '*'
                    set_color $fish_color_comment
                    echo " Mouse battery: $mouse_level%"
            end
            set_color normal

    end
end
