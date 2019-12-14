# My configuration files

Using [a simpler way to manage your dotfiles](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html).


## fish shell

[fish shell](https://fishshell.com/) THE shell :sparkles: :heart_eyes: :wink:

Add to path: `set -U fish_user_paths ~/bin $fish_user_paths`

Add env variable: set and export universal variable `set -Ux VAR "VAR_VALUE"` (or `set -gx LANG "en_US.UTF-8"` in `config.fish` if VAR conflicts with system variables, see [FAQ](https://fishshell.com/docs/current/faq.html#faq-exported-uvar))

See [tutorial](https://fishshell.com/docs/current/tutorial.html)

Use abbrevs:

```bash
abbr -a bug brew upgrade
abbr -a bo brew outdated
abbr -a bu brew update
```

## utilities

### cat >> bat

[bat](https://github.com/sharkdp/bat) a cat clone with wings

[add syntax](https://github.com/sharkdp/bat#adding-new-syntaxes--language-definitions) from sublime text; for [tmux.conf](https://github.com/gerardroche/sublime-tmux).

# grep

[ripgrep](https://github.com/BurntSushi/ripgrep) very fast grep

## golang

using [Ahmad guide](https://ahmadawais.com/install-go-lang-on-macos-with-homebrew/).

## vim

[upcase vim tutorial](https://thoughtbot.com/upcase/onramp-to-vim)

[vimcasts](http://vimcasts.org/episodes)

## tmux

[upcase tmux tutorial](https://thoughtbot.com/upcase/tmux)

book: [the tao of tmux](https://leanpub.com/the-tao-of-tmux/read)
