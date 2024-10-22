# Caps Word for neovim

Adoption of [QMK caps word feature](https://docs.qmk.fm/features/caps_word) for neovim. Provides a better experience for typing SCREAMING_SNAKE_CASE words automatically disables at the end of the word.

<div align="left"><p>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/dmtrKovalenko/caps-word.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/dmtrKovalenko/caps-word.nvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/dmtrKovalenko/caps-word.nvim?color=%23DDB6F2&label=SIZE&logo=pagespeedinsights&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=neogoose_btw">
      <img alt="follow on Twitter" src="https://img.shields.io/twitter/follow/neogoose_btw?style=for-the-badge&user=neogoose_btw&logo=x&color=8aadf3&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</div>

https://github.com/user-attachments/assets/be198aac-2c3a-4415-aff0-9f8913e45480

## ✨ Features

Automatically disables at the end of the word using [vim.o.iskeyword](https://neovim.io/doc/user/options.html#'iskeyword')

- Automatically disables on exiting insert mode
- Replaces "-" with "\_" so you can type snake-case words instead

## 📦 Installation

The plugin is optimized for lazy loading. You can use any plugin manager you want.

lazy.nvim:

```lua
  {
    "dmtrKovalenko/caps-word.nvim",
    lazy = true,
    opts = {},
    keys = {
      {
        mode = { "i", "n" },
        "<C-s>",
        "<cmd>lua require('caps-word').toggle()<CR>",
      },
    },
  },

```

## ⚙️ Configuration

List of options you can use with default values:

```lua
{
  -- Automatically changes `-` to `_` when caps word is activated
  auto_underscore_inject = true,
  -- Does not turn the caps mode off on number input
  enable_numbers_in_caps = true,
  -- Provide custom vim match regex for detecting end of the word (default is vim.o.iskeyword)
  match_word_string = nil,
  -- Callback when caps word mode is activated
  enter_callback = nil,
  -- Callback when caps word mode is deactivated
  exit_callback = nil,
}

```

## 🚀 Usage

Simply use a keybinding to toggle the caps word mode, type your constant and press `<space>`, or any other non-word character. The mode will be ✨ automatically ✨ disabled and you can continue typing as usual.

![demo gif](./demo.gif)

## ❓ FAQ

### How can I see when the plugin turns on and off?

You can use the callbacks provided in the options to send a notifications or print messages in the status line.

```lua
  {
    "dmtrKovalenko/caps-word.nvim",
    dir = "~/dev/caps-word.nvim",
    lazy = true,
    opts = {
      enter_callback = function()
        vim.notify("Caps Word: On", "info", { title = "Caps Word" })
      end,
      exit_callback = function()
        vim.notify("Caps Word: Off", "info", { title = "Caps Word" })
      end,
    },
    keys = {
      {
        mode = { "i", "n" },
        "<C-s>",
        "<cmd>lua require('caps-word').toggle()<CR>",
      },
    },
  },

```

### Should I try it if I already use QMK caps word?

No, if you absolutely like it, but I did because:

- QMK caps word does not know about your keybindings in insert mode and breaks them by changing the emitted keys
- it can't disable itself on insert leave, which is useful
- this plugin is buffer-local which helps when jumping between splits

## 🏆 Self-promotion

If you like this little tool subscribe to my [Twitter/X](https://x.com/neogoose_btw) for more updates on my open source work.
