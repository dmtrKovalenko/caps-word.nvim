# Caps Word

Adoption of [QMK caps word feature](https://docs.qmk.fm/features/caps_word) for neovim. Provides a better experience for typing SCREAMING_SNAKE_CASE words automatically disables at the end of the word.

<div align="left"><p>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/dmtrKovalenko/caps-word.nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/dmtrKovalenko/caps-word.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/dmtrKovalenko/caps-word.nvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/dmtrKovalenko/caps-word.nvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/dmtrKovalenko/caps-word.nvim?color=%23DDB6F2&label=SIZE&logo=pagespeedinsights&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=folke">
      <img alt="follow on Twitter" src="https://img.shields.io/twitter/follow/neogoose_btw?style=for-the-badge&logo=x&color=8aadf3&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</div>

![demo](./demo.mp4)

## ✨ Features

- Automatically disables in the end of the word using [vim.o.iskeyword](https://neovim.io/doc/user/options.html#'iskeyword')
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

The is fairly simple, here is a list of options you can use with default values:

```lua
{
-- Automatically changes - to * when caps word is activated

  auto_underscore_inject = true,
  -- Does not turn the caps mode off on number input
  enable_numbers_in_caps = true,
  -- Provide custom vim match regex for detecting end of the word (default is vim.o.iskeyword)
  match_word_string = nil,
}

```

## 🚀 Usage

Simply use a keybinding to toggle the caps word mode, type your constant and press <space> or any other non word character. The mode will be ✨ automatically ✨ disabled and you can continue typing as usual.

## Self promotion

If you like this little tool subscribe to my [Twitter/X](https://x.com/neogoose_btw) for more updates on my open source work.
