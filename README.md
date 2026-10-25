# Конфигурация Neovim

Минимальный `init.lua` на Lua:

- менеджер плагинов [packer.nvim](https://github.com/wbthomason/packer.nvim) ставится сам при первом запуске;
- тема [tokyonight](https://github.com/folke/tokyonight.nvim);
- дерево файлов [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) с иконками и статусом git;
- подсветка и отступы через [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter);
- номера строк, мышь, true color; лидер — `,`.

| Клавиши | Действие |
|---|---|
| `,e` | показать/скрыть дерево файлов |
| `,ee` | найти текущий файл в дереве |

## Установка (Linux/macOS)

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/Alex91132/vim ~/.config/nvim
nvim                       # первый запуск ставит packer — перезапустите Neovim
nvim +PackerSync           # поставить плагины
```

Нужны свежий Neovim (0.9+), git и шрифт [Nerd Font](https://www.nerdfonts.com/) для иконок.
