#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Post-Installation Setup Script for NikaVim

echo "🚀 NikaVim Setup Wizard"
echo "====================="
echo ""

# Check if nvim is installed
if ! command -v nvim >/dev/null 2>&1; then
    echo "❌ Neovim is not installed. Please install it first."
    echo "   Ubuntu/Debian: sudo apt install neovim"
    echo "   macOS: brew install neovim"
    echo "   Windows: choco install neovim"
    exit 1
fi

for command_name in git rg make; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
        echo "❌ Required command not found: $command_name"
        exit 1
    fi
done

echo "✅ Neovim installed: $(nvim --version | head -n1)"
echo ""

# Check Python support
echo "Checking Python support..."
if python3 -c "import pynvim" 2>/dev/null; then
    echo "✅ Python pynvim module found"
else
    echo "⚠️  Installing Python pynvim module..."
    python3 -m pip install --user pynvim
fi
echo ""

# Launch neovim with plugin installation
echo "🔧 Installing plugins..."
echo "Opening Neovim to install plugins (this may take a minute)..."
echo ""

nvim --headless -u "$SCRIPT_DIR/init.lua" "+Lazy! sync" +qa

echo ""
echo "✅ Plugins installed!"
echo ""

# Open Mason only when explicitly requested. This keeps the script noninteractive by default.
if [[ ${NIKAVIM_OPEN_MASON:-0} == "1" ]]; then
    nvim -u "$SCRIPT_DIR/init.lua" +Mason
else
    echo "ℹ️  Run NIKAVIM_OPEN_MASON=1 ./setup.sh to open Mason for language-server installation."
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Run: nvim"
echo "  2. Press Space (leader key) to see available commands"
echo "  3. Try these keymaps:"
echo "     - <leader>ff : Find files"
echo "     - <leader>fg : Search text"
echo "     - <C-n> : Toggle file explorer"
echo "  4. Read README.md for more information"
echo ""
echo "Happy coding! 🚀"
