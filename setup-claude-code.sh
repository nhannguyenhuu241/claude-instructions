#!/bin/bash
# CLAUDE CODE - AUTO SETUP SCRIPT
# Script tự động cài đặt và cấu hình Claude Code

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -q Microsoft /proc/version 2>/dev/null; then
            echo "wsl"
        else
            echo "linux"
        fi
    else
        echo "unknown"
    fi
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main installation
main() {
    info "🚀 Claude Code Auto Setup Script"
    info "================================"
    
    OS=$(detect_os)
    info "Detected OS: $OS"
    
    # Check prerequisites
    info "\n📋 Checking prerequisites..."
    
    # Check curl
    if ! command_exists curl; then
        error "curl is not installed. Please install curl first."
    fi
    info "✓ curl is installed"
    
    # Install Claude Code
    info "\n📦 Installing Claude Code..."
    
    if command_exists claude; then
        warn "Claude Code is already installed"
        read -p "Do you want to reinstall? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            info "Skipping installation"
        else
            info "Installing Claude Code..."
            curl -fsSL https://claude.ai/install.sh | bash
        fi
    else
        info "Installing Claude Code via native installer..."
        curl -fsSL https://claude.ai/install.sh | bash
    fi
    
    # Verify installation
    info "\n✅ Verifying installation..."
    if command_exists claude; then
        VERSION=$(claude --version 2>&1 || echo "unknown")
        info "✓ Claude Code installed successfully"
        info "  Version: $VERSION"
    else
        error "Installation failed. Claude command not found."
    fi
    
    # Check PATH
    info "\n🔍 Checking PATH configuration..."
    if command_exists claude; then
        CLAUDE_PATH=$(which claude)
        info "✓ Claude Code is in PATH: $CLAUDE_PATH"
    else
        warn "Claude Code may not be in PATH. You might need to:"
        echo "  1. Close and reopen your terminal"
        echo "  2. Or run: source ~/.bashrc (or ~/.zshrc)"
    fi
    
    # Setup shell profile
    info "\n🔧 Configuring shell profile..."
    
    SHELL_PROFILE=""
    if [ -f "$HOME/.zshrc" ]; then
        SHELL_PROFILE="$HOME/.zshrc"
    elif [ -f "$HOME/.bashrc" ]; then
        SHELL_PROFILE="$HOME/.bashrc"
    fi
    
    if [ -n "$SHELL_PROFILE" ]; then
        # Add PATH if not already there
        if ! grep -q "/.local/bin" "$SHELL_PROFILE" 2>/dev/null; then
            echo '' >> "$SHELL_PROFILE"
            echo '# Claude Code PATH' >> "$SHELL_PROFILE"
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_PROFILE"
            info "✓ Added PATH to $SHELL_PROFILE"
        else
            info "✓ PATH already configured in $SHELL_PROFILE"
        fi
    fi
    
    # Create .claude directory
    info "\n📁 Creating configuration directory..."
    mkdir -p "$HOME/.claude"
    info "✓ Created ~/.claude directory"
    
    # Create default settings
    SETTINGS_FILE="$HOME/.claude/settings.json"
    if [ ! -f "$SETTINGS_FILE" ]; then
        cat > "$SETTINGS_FILE" << 'EOF'
{
  "editorPreference": "code",
  "autoApprove": false,
  "includeHiddenFiles": false
}
EOF
        info "✓ Created default settings.json"
    else
        info "✓ Settings file already exists"
    fi
    
    # Run doctor
    info "\n🏥 Running Claude Code doctor..."
    if command_exists claude; then
        claude doctor || warn "Doctor check completed with warnings"
    fi
    
    # Setup complete
    info "\n✨ Setup completed successfully!"
    info "================================"
    info "\n📝 Next steps:"
    echo "  1. Restart your terminal (or run: source $SHELL_PROFILE)"
    echo "  2. Navigate to your project: cd ~/your-project"
    echo "  3. Start Claude Code: claude"
    echo "  4. Follow authentication prompts"
    info "\n💡 Quick tips:"
    echo "  - Use 'claude --version' to check version"
    echo "  - Use 'claude doctor' to diagnose issues"
    echo "  - Type '/help' in Claude Code for commands"
    info "\n📚 Documentation:"
    echo "  - Full guide: HUONG_DAN_CLAUDE_CODE.md"
    echo "  - Quick start: QUICK_START.md"
    echo "  - Prompts: PROMPT_TEMPLATES.md"
    echo "  - Official docs: https://docs.claude.com"
    
    info "\n🎉 Happy coding with Claude!"
}

# Run main function
main "$@"
