# Fix Avante Chat Error

The error `deserialize error: invalid value: byte array, expected a string` typically means Avante's binary components need to be rebuilt.

## Solution Steps:

### 1. Clean and Rebuild Avante

Open Neovim and run:
```vim
:Lazy clean avante.nvim
:Lazy install avante.nvim
```

This will force a complete rebuild using your `nvim-make` wrapper.

### 2. Alternative: Manual Rebuild

If the above doesn't work, manually rebuild:

```bash
# Navigate to Avante plugin directory
cd ~/.local/share/nvim/lazy/avante.nvim

# Clean previous build
make clean

# Rebuild with Node 22 (using your wrapper)
~/.config/nvim/scripts/nvim-make

# Or if that doesn't work, build directly
make
```

### 3. Check Build Output

If the build fails, check what's happening:

```bash
cd ~/.local/share/nvim/lazy/avante.nvim
~/.config/nvim/scripts/nvim-make BUILD_FROM_SOURCE=true
```

### 4. Verify Avante's Dependencies

Avante might need additional build tools:

```bash
# Check if you have required tools
which make
which curl
which cargo  # Rust might be needed

# If cargo is missing (Avante uses Rust):
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Common Causes

1. **Incomplete Build**: Binary wasn't compiled properly
2. **Binary Compatibility**: Built for wrong architecture
3. **Missing Dependencies**: Rust/Cargo not installed
4. **Corrupt Cache**: Old build artifacts interfering

## Quick Fix (Nuclear Option)

If nothing else works:

```bash
# Remove Avante completely
rm -rf ~/.local/share/nvim/lazy/avante.nvim
rm -rf ~/.cache/nvim/avante*
rm -rf ~/.local/state/nvim/avante*

# Open Neovim - it will reinstall automatically
nvim
```

Then try opening Avante again.

