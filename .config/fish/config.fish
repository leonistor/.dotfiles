# aliases

function d
	# ls -lah
	# mac:
	ls -AlhG $argv
end

function mcd
	mkdir -p $argv;
	cd $argv;
end

# bobthefish options
set -g theme_display_virtualenv no
set -g theme_powerline_fonts yes
set -g theme_color_scheme light
set -g theme_date_format "+%a %H:%M"
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path yes

# set path: user only, once, in shell, not in config file!
# set -U fish_user_paths ~/bin $fish_user_paths
# cookbook
# https://github.com/jorgebucaran/fish-cookbook

# .config/bat/config
# --theme="OneHalfLight"
# --style="numbers,changes"

# set arrow keys in osx terminal
# https://coderwall.com/p/ygcaqg/get-alt-arrow-keys-working-in-fish-on-osx

# nvm
# https://github.com/jorgebucaran/fisher
# https://github.com/jorgebucaran/fish-nvm

# crystal
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# locale
# set -gx LANG "en_US.UTF-8"
# set -gx LC_ALL "en_US.UTF-8"
