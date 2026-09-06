# Contributing to NikaVim

We welcome contributions! Here's how to contribute:

## Types of Contributions

- 🐛 **Bug Reports**: Found a problem? Report it
- ✨ **Features**: Have a great idea? Share it
- 📚 **Documentation**: Help improve guides and examples
- 🎨 **UI/UX**: Visual improvements and refinements
- ⚡ **Performance**: Optimization and speed improvements
- 🧪 **Tests**: Add test coverage or examples

## Development Setup

1. **Fork & Clone**:
   ```bash
   git clone https://github.com/yourusername/nikavim.git
   cd nikavim
   ```

2. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   # or for bug fixes:
   git checkout -b fix/issue-name
   ```

3. **Test your changes**:
   ```bash
   nvim --version
   nvim --headless -u init.lua "+checkhealth nikavim" +qa
   ```

## Commit Guidelines

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
git commit -m "type(scope): description"

# Examples:
git commit -m "feat(lsp): add rust analyzer configuration"
git commit -m "fix(treesitter): correct module name reference"
git commit -m "docs(readme): update installation steps"
git commit -m "perf(plugins): lazy load telescope on demand"
```

**Types**: `feat`, `fix`, `docs`, `perf`, `refactor`, `test`, `chore`  
**Scope**: `lsp`, `plugins`, `ui`, `keymaps`, `completion`, etc.

## Code Style

- **Lua**: Follow [Lua style guide](https://github.com/luaforge/lua-style-guide)
  - 2-space indentation (configured in `.editorconfig` if present)
  - Clear, descriptive variable names
  - Comment complex logic
  
- **Plugin Config**: Keep configurations in appropriate `lua/plugins/*.lua` files
- **Keymaps**: Add to `lua/core/keymaps.lua` with descriptions

## Testing & Verification

Before submitting:

1. **Test with clean startup**:
   ```bash
   nvim --headless -u init.lua +qa
   ```

2. **Verify no errors**:
   ```bash
   nvim --headless -u init.lua "+checkhealth nikavim" +qa
   ```

   Also inspect `:messages` in an interactive session and confirm that
   `vim.v:errmsg` is empty after startup.

3. **Test your specific feature**:
   - Open a file and verify functionality works
   - Check status line and file explorer
   - Test relevant keybindings

4. **Check startup time**:
   ```bash
   nvim --startuptime startup.log && tail startup.log
   ```

5. **Validate the plugin graph**:
   - Every declared plugin must be represented in `lazy-lock.json`.
   - Plugin installation must succeed from an empty Neovim data directory.
   - Do not hide configuration errors with broad `pcall` calls.

## Pull Request Process

1. **Create a descriptive PR title**:
   ```
   feat: add DAP (debug adapter protocol) support
   fix: correct tree-sitter module loading issue
   docs: improve LSP setup documentation
   ```

2. **Fill out the PR description**:
   - **What**: What does this change do?
   - **Why**: Why is this needed?
   - **How**: How does it work?
   - **Testing**: How did you test it?

3. **Link related issues**:
   ```markdown
   Fixes #123
   Related to #456
   ```

4. **Update documentation**:
   - Update relevant `.md` files if needed
   - Add/update comments in code
   - Update `CHANGELOG.md` with your changes

5. **One feature per PR**: Keep PRs focused and reviewable

## Issue Reporting

When reporting bugs, include:

```markdown
### Description
Clear description of the issue

### Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

### Expected Behavior
What should happen

### Actual Behavior
What actually happens

### Environment
- Neovim version: `nvim --version`
- OS: Linux/macOS/Windows
- Plugin manager: Lazy.nvim
```

## Review Process

- Maintainer will review your PR
- Feedback or changes may be requested
- Once approved, your PR will be merged
- You'll be credited in the CHANGELOG

## Documentation Standards

- Update README.md if adding new features
- Add examples for complex features
- Document required external tools and optional integrations
- Keep feature claims consistent with tested behavior
- Link to relevant external resources

## License

By contributing, you agree that your contributions will be licensed under the MIT License. See [LICENSE](./LICENSE) file for details.

## Need Help?

- 📖 Check [ADVANCED.md](./ADVANCED.md) for customization examples
- 🔍 Search existing issues and PRs
- 📚 Review [Neovim Docs](https://neovim.io/doc/user/)

---

**Thank you for contributing!** 🎉
