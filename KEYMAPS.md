# Keymaps Quick Reference

## ✏️ Basic Navigation & Editing
| Keybind | Action |
|---------|--------|
| `jk` | Exit insert mode |
| `<C-s>` | Save file |
| `<leader>w` | Save |
| `<leader>q` | Quit all |
| `<Esc>` | Clear search highlight |

## 🪟 Split Navigation & Management
| Keybind | Action |
|---------|--------|
| `<C-h>` | Move to left split |
| `<C-l>` | Move to right split |
| `<C-j>` | Move to lower split |
| `<C-k>` | Move to upper split |
| `<C-Up/Down/Left/Right>` | Resize split |

## 📑 Buffer Management
| Keybind | Action |
|---------|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>bd` | Delete buffer |

## 🔎 Fuzzy Finding (Telescope)
| Keybind | Action |
|---------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fc` | Commands |

## 📁 File Explorer
| Keybind | Action |
|---------|--------|
| `<C-n>` | Toggle explorer |
| `<leader>e` | Focus explorer |

## 🧠 LSP (Language Server)
| Keybind | Action |
|---------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `go` | Go to type definition |
| `gs` | Signature help |
| `<F2>` | Rename symbol |
| `<F3>` | Format code |
| `<F4>` | Code actions |

## ✨ Completion & Snippets
| Keybind | Action |
|---------|--------|
| `<C-Space>` | Trigger completion |
| `<Tab>` | Next completion/snippet |
| `<S-Tab>` | Previous completion/snippet |
| `<C-l>` | Jump to next snippet |
| `<C-h>` | Jump to prev snippet |

## Multi-Cursor (vim-visual-multi)
| Keybind | Action |
|---------|--------|
| `<leader>ma` | Add cursor at word |
| `<leader>mn` | Add cursor, skip next match |
| `<leader>mD` | Add cursor below |
| `<leader>mU` | Add cursor above |
| `q` | Skip current region (in multi-cursor mode) |
| `Q` | Remove current region (in multi-cursor mode) |

## Editing Enhancements
| Keybind | Action |
|---------|--------|
| `gc` | Toggle comment (line) |
| `gb` | Toggle comment (block) |
| `ys<motion><char>` | Surround (surround.nvim) |
| `cs<old><new>` | Change surrounding |
| `ds<char>` | Delete surrounding |

## 🖥️ Integrated Terminal (toggleterm.nvim)
| Keybind | Action |
|---------|--------|
| `<leader>tt` | Toggle terminal |
| `<leader>tF` | Toggle floating terminal |
| `<leader>th` | Toggle horizontal terminal |
| `<leader>tv` | Toggle vertical terminal |
| `<C-\>` | Toggle terminal (normal/terminal mode) |
| `<Esc>` | Exit terminal mode (terminal buffer) |

## 🤖 AI Chat (CopilotChat)
| Keybind | Action |
|---------|--------|
| `<leader>ac` | Toggle Copilot Chat panel |
| `<leader>aq` | Open quick chat prompt |
| `<leader>aa` | Add selected code to chat |
| `<leader>ar` | Reset chat session |

## Zen / Focus Mode
| Keybind | Action |
|---------|--------|
| `<leader>zz` | Toggle Zen mode (distraction-free) |
| `<leader>zt` | Toggle Twilight (dim inactive areas) |

## 💾 Session Management
| Keybind | Action |
|---------|--------|
| `<leader>Ss` | Save current session |
| `<leader>Sl` | Restore last session |
| `<leader>Sd` | Stop auto-saving session |

## Navigation & Outline
| Keybind | Action |
|---------|--------|
| `<leader>nb` | Toggle Navbuddy (code outline tree) |
| `<leader>no` | Toggle Navbuddy (alternative) |
| (breadcrumb) | LSP breadcrumbs in statusline (auto) |

## 🧰 Tasks (Overseer)
| Keybind | Action |
|---------|--------|
| `<leader>rr` | Run task |
| `<leader>rb` | Build |
| `<leader>rt` | Toggle task panel |
| `<leader>rq` | Quick action on task |
| `<leader>ro` | Open task output |

## 🌐 REST Client
| Keybind | Action |
|---------|--------|
| `<leader>Rt` | Run current REST request (`.http` files) |
| `<leader>Rl` | Re-run last request |
| `<leader>Rp` | Preview cURL command |

## 🗄️ Database (vim-dadbod)
| Keybind | Action |
|---------|--------|
| `<leader>Dc` | Open DB prompt |
| `<leader>Dq` | List database tables |
| `<leader>Du` | Toggle DB UI panel |
| `<leader>Df` | Find DB buffer |

## Minimap
| Keybind | Action |
|---------|--------|
| `<leader>mm` | Toggle code minimap |
| `<leader>mM` | Toggle maximized minimap |

## Screencast
| Keybind | Action |
|---------|--------|
| `<leader>kx` | Toggle screenkey (show keystrokes) |

## 🐙 GitHub (Octo)
| Keybind | Action |
|---------|--------|
| `<leader>gi` | List GitHub issues |
| `<leader>gpr` | List pull requests |
| `<leader>gprv` | View pull request |
| `<leader>gpc` | Checkout PR |
| `<leader>gpm` | Merge PR |

## Git Graph
| Keybind | Action |
|---------|--------|
| `<leader>gg` | Toggle git commit graph |

## Flash Navigation (jump to any visible character)
| Keybind | Action |
|---------|--------|
| `s` | Flash forward — then type the target label |
| `S` | Flash backward |

## Todo Comments
| Keybind | Action |
|---------|--------|
| `]t` | Jump to next TODO/FIXME/HACK comment |
| `[t` | Jump to previous TODO/FIXME/HACK |
| `<leader>xt` | Show all todos in Trouble panel |
| `<leader>xT` | Show only TODO/FIXME in Trouble |
| `<leader>st` | List todos in Telescope |

## Quick File Bookmarks (Harpoon)
| Keybind | Action |
|---------|--------|
| `<leader>ha` | Add current file to Harpoon |
| `<leader>hh` | Open Harpoon quick menu |
| `<leader>h1` | Jump to Harpoon file 1 |
| `<leader>h2` | Jump to Harpoon file 2 |
| `<leader>h3` | Jump to Harpoon file 3 |
| `<leader>h4` | Jump to Harpoon file 4 |
| `<leader>h5` | Jump to Harpoon file 5 |

## Rename with Preview
| Keybind | Action |
|---------|--------|
| `<leader>rn` | Rename symbol (with inline diff preview) |

## LSP Extras (Code Lens & Call Hierarchy)
| Keybind | Action |
|---------|--------|
| `<leader>Lc` | Run code lens action |
| `<leader>Lr` | Refresh code lens |
| `<leader>Li` | Show incoming calls |
| `<leader>Lo` | Show outgoing calls |

## Search & Motion
| Keybind | Action |
|---------|--------|
| `/` | Search forward |
| `?` | Search backward |
| `*` | Search word forward |
| `#` | Search word backward |
| `n` | Next result (centered) |
| `N` | Previous result (centered) |

## Text Movement (Visual Mode)
| Keybind | Action |
|---------|--------|
| `J` | Move line down |
| `K` | Move line up |
| `af` / `if` | Select function outer / inner text object |

## Editor Navigation
| Keybind | Action |
|---------|--------|
| `<C-CR>` | Insert blank line below |
| `<C-n>` | Toggle file explorer |

## Git Operations (Gitsigns & Fugitive)
| Keybind | Action |
|---------|--------|
| `]c` | Next git change |
| `[c` | Previous git change |
| `<leader>hs` | Stage hunk |
| `<leader>hu` | Undo stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>tb` | Toggle blame |
| `<leader>hd` | Diff file |
| `<leader>gc` | Git commit |
| `<leader>gp` | Git push |
| `<leader>gl` | Git log |
| `<leader>gs` | Git status |

## 🐞 Debugging (DAP)
| Keybind | Action |
|---------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Toggle conditional breakpoint |
| `<leader>dc` | Continue / start debugger |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Restart debug session |
| `<leader>dq` | Terminate debug session |
| `<leader>dt` | Toggle DAP UI sidebar |

## Diagnostics & Symbols (Trouble)
| Keybind | Action |
|---------|--------|
| `<leader>xx` | Toggle diagnostics panel (all) |
| `<leader>xX` | Diagnostics for current buffer |
| `<leader>xs` | Toggle symbols panel |
| `<leader>xl` | Loclist |
| `<leader>xq` | Quickfix list |

## Test Runner (Neotest)
| Keybind | Action |
|---------|--------|
| `<leader>tr` | Run nearest test |
| `<leader>tf` | Run current test file |
| `<leader>ta` | Run all tests in project |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Open test output |

## Project Management
| Keybind | Action |
|---------|--------|
| `<leader>pp` | Find and switch projects |

## Copilot (Insert Mode)
| Keybind | Action |
|---------|--------|
| `<M-l>` | Accept suggestion |
| `<M-]>` | Next suggestion |
| `<M-[>` | Previous suggestion |

## Tools & Utilities
| Keybind | Action |
|---------|--------|
| `<leader>l` | Lazy plugin manager |
| `<leader>m` | Mason package manager |
| `<leader>u` | Toggle undo tree |
| `<leader>fp` | Format with conform |
| `<leader>fl` | Lint with nvim-lint |

## Terminal Mode
| Keybind | Action |
|---------|--------|
| `<Esc>` | Exit terminal |

---

**Leader Key:** `<Space>`

For more info, see the main [README.md](./README.md)
