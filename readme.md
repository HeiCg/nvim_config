<link rel="stylesheet" href="./style.css">

# Summary
<ul>
    <li><a href="#requirements">Requirements</a></li>
    <li><a href="#setup">Setup</a></li>
    <ul>
        <li><a href="#font">Font</a></li>
        <li><a href="#theme">Theme</a></li>
        <li><a href="#lualine-theme">Lualine Theme</a></li>
    </ul>
</ul>

## <a id="requirements">Requirements</a>
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

## <a id="setup">Setup</a>

### <a id="font">Font</a>
JetBrainMono with Ligatures
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures

> FYI: gnome-shell dont support ligatures


### <a id="theme">Theme</a>
The theme default is [rose-pine](https://github.com/rose-pine/neovim), to change theme you can just modify /lua/user/colorsheme.lua file

#### <a id="lualine-theme">Lualine theme</a>
The lualine theme is setup auto, but in some sections the colors was set manually

So that the themes of the all sections are automatically configured you just change the /lua/user/lualine.lua file commenting the color options in each sections.
