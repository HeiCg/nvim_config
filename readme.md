## Requirements

1. https://github.com/BurntSushi/ripgrep (Telescope)
```sh
sudo apt install ripgrep
```

2. https://github.com/sharkdp/fd (Telescope)
```sh
sudo apt install fd-find
```

3. Pandoc (MarkdownPreview)
```sh
sudo apt install pandoc
```

4. live-server (MarkdownPreview)
```
npm install -g @compodoc/live-server
```

> 5. (Implicit?) to install live-server you'll needed the nodejs

## Setup

### Font
JetBrainMono with Ligatures
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures

> FYI: gnome-shell dont support ligatures


### Theme

The theme default is [rose-pine](https://github.com/rose-pine/neovim), to change theme you can just modify /lua/user/colorsheme.lua file

#### Lualine theme

The lualine theme is setup auto, but in some sections the colors was set manually

So that the themes of the all sections are automatically configured you just change the /lua/user/lualine.lua file commenting the color options in each sections.
