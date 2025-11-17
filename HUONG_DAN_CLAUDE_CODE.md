# HƯỚNG DẪN CHI TIẾT CÀI ĐẶT VÀ SỬ DỤNG CLAUDE CODE

## 📋 MỤC LỤC
1. [Giới thiệu](#giới-thiệu)
2. [Yêu cầu hệ thống](#yêu-cầu-hệ-thống)
3. [Cài đặt theo nền tảng](#cài-đặt-theo-nền-tảng)
   - [macOS](#cài-đặt-trên-macos)
   - [Windows](#cài-đặt-trên-windows)
   - [Linux (Ubuntu/Debian)](#cài-đặt-trên-linux)
4. [Xác thực tài khoản](#xác-thực-tài-khoản)
5. [Tích hợp với IDE](#tích-hợp-với-ide)
6. [Sử dụng cơ bản](#sử-dụng-cơ-bản)
7. [Tips & Tricks](#tips--tricks)
8. [Troubleshooting](#troubleshooting)

---

## 🎯 GIỚI THIỆU

**Claude Code** là công cụ dòng lệnh (command-line tool) của Anthropic, cho phép bạn sử dụng AI Claude trực tiếp trong môi trường development của mình.

### Điểm khác biệt so với các AI Assistant khác:
- ✅ **Làm việc trực tiếp với file**: Đọc, viết, chỉnh sửa file trong project
- ✅ **Giữ nguyên context**: Hiểu toàn bộ cấu trúc project
- ✅ **Thực thi lệnh**: Chạy tests, linting, git commands
- ✅ **Tự động hóa workflow**: Từ coding đến deployment

### Lưu ý quan trọng:
> **Claude Code là command-line tool, KHÔNG PHẢI là IDE plugin.** Nó chạy trong Terminal/Command Line và có thể tích hợp với các IDE thông qua extensions.

---

## 💻 YÊU CẦU HỆ THỐNG

### Hệ điều hành được hỗ trợ:
- **macOS**: 10.15+ (Catalina trở lên)
- **Linux**: Ubuntu 20.04+, Debian 10+, hoặc các distro tương tự
- **Windows**: 10/11 với **WSL 2** (Windows Subsystem for Linux)

### Yêu cầu bổ sung:
- **Node.js**: 18.0+ (chỉ cho phương thức cài đặt npm - không khuyến khích)
- **Git**: Khuyến nghị để sử dụng các tính năng version control
- **ripgrep**: Thường được tự động cài kèm Claude Code

### Yêu cầu về tài khoản:
Bạn cần **1 trong 2 loại tài khoản** sau:

1. **Claude Max Subscription** (Khuyến nghị cho dev thường xuyên)
   - Giá cố định hàng tháng
   - Usage limit cao hơn
   - Tiết kiệm hơn cho sử dụng nhiều

2. **Anthropic API Account**
   - Pay-per-use (trả theo lượt sử dụng)
   - Có thể tốn kém nếu dùng nhiều
   - Khuyến nghị: Nạp ~$20 để test workflow trước

---

## 🚀 CÀI ĐẶT THEO NỀN TẢNG

## Cài đặt trên macOS

### Phương thức 1: Native Installer (Khuyến nghị) ⭐

**Bước 1: Cài đặt Claude Code**

Mở Terminal và chạy lệnh sau:

```bash
# Cài đặt phiên bản stable (khuyến nghị)
curl -fsSL https://claude.ai/install.sh | bash

# Hoặc cài đặt phiên bản latest
curl -fsSL https://claude.ai/install.sh | bash -s latest

# Hoặc cài đặt version cụ thể
curl -fsSL https://claude.ai/install.sh | bash -s 1.0.58
```

**Bước 2: Xác minh cài đặt**

```bash
# Kiểm tra version
claude --version

# Kiểm tra trạng thái cài đặt
claude doctor
```

**Bước 3: Khởi động Claude Code**

```bash
# Di chuyển đến thư mục project
cd ~/Documents/my-project

# Khởi động Claude Code
claude
```

### Phương thức 2: Cài đặt qua npm (Legacy)

**Lưu ý**: Phương thức này không còn được khuyến nghị, nhưng vẫn hoạt động.

```bash
# Cài đặt Node.js (nếu chưa có)
# Tải từ https://nodejs.org hoặc dùng Homebrew:
brew install node

# Cài đặt Claude Code
npm install -g @anthropic-ai/claude-code

# Xác minh
claude --version
```

### Migration từ npm sang Native Installer

Nếu bạn đang dùng phiên bản npm, migrate sang native installer:

```bash
# Chạy lệnh migrate
claude install

# Các file config sẽ được giữ nguyên:
# - ~/.claude/settings.json
# - .claude/ trong project
```

---

## Cài đặt trên Windows

### ⚠️ LƯU Ý QUAN TRỌNG:
**Claude Code KHÔNG CHẠY TRỰC TIẾP trên Windows.** Bạn BẮT BUỘC phải cài đặt **WSL 2** (Windows Subsystem for Linux).

### Bước 1: Cài đặt WSL 2

**Cách 1: Tự động (Windows 11/10 mới)**

Mở PowerShell hoặc Command Prompt **với quyền Administrator** và chạy:

```powershell
wsl --install
```

Sau khi cài đặt xong, khởi động lại máy.

**Cách 2: Manual (Windows 10 cũ)**

1. Bật WSL feature:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

2. Bật Virtual Machine feature:
```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

3. Khởi động lại máy

4. Tải và cài đặt WSL 2 kernel update:
   - Tải từ: https://aka.ms/wsl2kernel

5. Set WSL 2 làm mặc định:
```powershell
wsl --set-default-version 2
```

6. Cài đặt Ubuntu từ Microsoft Store:
   - Mở Microsoft Store
   - Tìm "Ubuntu 22.04 LTS"
   - Click "Install"

### Bước 2: Setup Ubuntu trong WSL

1. Mở Ubuntu từ Start Menu
2. Tạo username và password khi được yêu cầu
3. Update hệ thống:

```bash
sudo apt update && sudo apt upgrade -y
```

### Bước 3: Cài đặt Claude Code trong WSL

**Phương thức Native Installer (Khuyến nghị):**

```bash
# Trong Ubuntu terminal
curl -fsSL https://claude.ai/install.sh | bash
```

**Hoặc phương thức npm:**

```bash
# Cài đặt Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Cài đặt Claude Code
npm install -g @anthropic-ai/claude-code
```

### Bước 4: Cấu hình PATH (nếu dùng npm)

```bash
# Thêm vào ~/.bashrc
echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.npm-global/bin"' >> ~/.bashrc

# Reload config
source ~/.bashrc
```

### Bước 5: Truy cập Windows files từ WSL

```bash
# Windows C:\ được mount tại /mnt/c/
cd /mnt/c/Users/YourUsername/Documents/my-project

# Hoặc tạo project trong WSL (performance tốt hơn)
cd ~/my-project
```

### Tối ưu hóa WSL 2 (Tùy chọn)

Tạo file `.wslconfig` trong thư mục Windows user của bạn:

```ini
# File: C:\Users\YourUsername\.wslconfig
[wsl2]
memory=8GB              # Giới hạn RAM
processors=4            # Giới hạn CPU cores
swap=2GB                # Kích thước swap
localhostForwarding=true
```

### Windows Terminal (Khuyến nghị)

Tải Windows Terminal để có trải nghiệm tốt hơn:
- Microsoft Store: tìm "Windows Terminal"
- Hoặc GitHub: https://github.com/microsoft/terminal/releases

---

## Cài đặt trên Linux

### Ubuntu 20.04+ / Debian 10+

**Phương thức 1: Native Installer (Khuyến nghị)**

```bash
# Cài đặt
curl -fsSL https://claude.ai/install.sh | bash

# Xác minh
claude --version
claude doctor
```

**Phương thức 2: npm**

```bash
# Cài đặt Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Cấu hình npm global (QUAN TRỌNG - tránh dùng sudo)
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'

# Thêm vào PATH
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Cài đặt Claude Code (KHÔNG DÙNG sudo)
npm install -g @anthropic-ai/claude-code

# Xác minh
claude --version
```

### Alpine Linux và distro khác

Đối với Alpine Linux hoặc các distro dùng musl/uClibc, cần cài thêm:

```bash
# Alpine
apk add libgcc libstdc++ ripgrep

# Sau đó cài Claude Code như bình thường
curl -fsSL https://claude.ai/install.sh | sh
```

### CentOS / RHEL

```bash
# Cài đặt Node.js
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Cấu hình và cài đặt như Ubuntu
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

npm install -g @anthropic-ai/claude-code
```

---

## 🔐 XÁC THỰC TÀI KHOẢN

Khi chạy Claude Code lần đầu tiên, bạn sẽ được yêu cầu xác thực.

### Phương thức 1: Claude Console (Khuyến nghị)

```bash
claude
```

Hệ thống sẽ:
1. Hiển thị 2 options: **Console** hoặc **API**
2. Chọn **Claude Console**
3. Mở browser để OAuth
4. Đăng nhập vào tài khoản Claude của bạn
5. Authorize ứng dụng
6. Một workspace "Claude Code" sẽ tự động được tạo

**Lưu ý**: 
- Yêu cầu active billing tại console.anthropic.com
- Workspace "Claude Code" chỉ dùng cho Claude Code
- KHÔNG THỂ tạo API keys cho workspace này

### Phương thức 2: API Key

**Bước 1: Lấy API Key**

1. Truy cập: https://console.anthropic.com
2. Vào Settings → API Keys
3. Create new API key
4. Copy key (chỉ hiện 1 lần duy nhất!)

**Bước 2: Cấu hình**

Có 2 cách:

**Cách 1: Environment Variable (Khuyến nghị)**

```bash
# Thêm vào ~/.bashrc hoặc ~/.zshrc
export ANTHROPIC_API_KEY="sk-ant-api03-xxxxx"

# Reload
source ~/.bashrc  # hoặc source ~/.zshrc
```

**Cách 2: Nhập khi chạy Claude**

```bash
claude
# Chọn "API" và nhập key khi được yêu cầu
```

### Chọn Model

```bash
# Mặc định: Claude Sonnet 4.5
# Có thể set model khác:

# Claude Sonnet 4.5 (khuyến nghị - balanced)
export ANTHROPIC_MODEL="claude-sonnet-4-5-20250929"

# Claude Opus 4 (maximum capability)
export ANTHROPIC_MODEL="claude-opus-4-20250514"

# Claude Haiku (cost-effective)
export ANTHROPIC_MODEL="claude-3-5-haiku-20241022"
```

---

## 🔧 TÍCH HỢP VỚI IDE

Claude Code là **command-line tool**, nhưng có thể tích hợp với IDE thông qua extensions.

## Visual Studio Code

### Cài đặt Extension

**Cách 1: Qua VS Code UI**

1. Mở VS Code
2. Click vào icon **Extensions** (hoặc `Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Tìm "Claude Code"
4. Click **Install**

**Cách 2: Qua Command Palette**

1. `Ctrl+Shift+P` / `Cmd+Shift+P`
2. Gõ "Extensions: Install Extensions"
3. Tìm và cài "Claude Code"

**Cách 3: Terminal**

```bash
code --install-extension anthropic.claude-code
```

### Sử dụng trong VS Code

1. Mở project folder trong VS Code
2. Mở Terminal trong VS Code (`Ctrl+`` hoặc `View → Terminal`)
3. Chạy lệnh:

```bash
claude
```

### Kết nối VS Code với WSL (Windows)

```bash
# Từ WSL terminal, trong thư mục project
code .
```

VS Code sẽ tự động kết nối với WSL và mở project.

---

## Cursor IDE

Cursor là IDE fork từ VS Code, tối ưu cho AI coding.

### Cài đặt Extension

1. Mở Cursor
2. Extensions → Search "Claude Code"
3. Install extension

### Sử dụng

```bash
# Trong Cursor terminal
claude
```

---

## Android Studio

**Lưu ý**: Android Studio KHÔNG có extension chính thức cho Claude Code.

### Cách sử dụng:

**Option 1: Dùng Terminal built-in**

1. Mở Android Studio
2. View → Tool Windows → Terminal
3. Chạy Claude Code trong terminal đó:

```bash
cd ~/AndroidStudioProjects/MyApp
claude
```

**Option 2: Terminal riêng**

1. Mở Terminal/iTerm riêng
2. Navigate đến project Android
3. Chạy Claude Code

```bash
cd ~/AndroidStudioProjects/MyApp
claude
```

### Workflow với Android Studio:

```bash
# Trong terminal Claude Code
> analyze this Android project structure
> fix the MainActivity.kt implementation
> add unit tests for UserRepository
> optimize gradle build configuration
```

---

## IntelliJ IDEA / WebStorm / PyCharm

Tương tự Android Studio - sử dụng qua built-in Terminal.

### Setup:

1. Mở IDE
2. View → Tool Windows → Terminal
3. Terminal sẽ mở tại thư mục project
4. Chạy:

```bash
claude
```

### Tips:

```bash
# Tạo file .claude/settings.json trong project
{
  "editorPreference": "code",  # hoặc "idea" cho IntelliJ
  "autoApprove": false
}
```

---

## 📖 SỬ DỤNG CƠ BẢN

### Khởi động Claude Code

```bash
# Di chuyển đến thư mục project
cd ~/projects/my-app

# Khởi động
claude

# Hoặc khởi động với model cụ thể
claude --model claude-sonnet-4-20250514
```

### Các lệnh cơ bản

#### Commands bắt đầu với `/`

```bash
# Hiển thị help
/help

# Cấu hình settings
/config

# Xóa conversation và bắt đầu lại
/clear

# Tóm tắt session hiện tại
/compact

# Thoát Claude Code
/quit

# Rewind - quay lại trạng thái trước (v2.0.0+)
/rewind
# Hoặc double ESC
```

#### Tương tác tự nhiên

```bash
# Phân tích codebase
> explain this codebase architecture

# Đọc và giải thích file
> read the app.py file and explain what it does

# Tạo file mới
> create a simple hello.py file that prints 'Hello, Claude!'

# Fix bug
> fix the bug in authentication.py

> there's a memory leak in the user service, can you find and fix it?

# Tối ưu code
> optimize the database queries in models.py

# Thêm tests
> add comprehensive unit tests for the user service

# Refactor
> refactor this code to use async/await instead of callbacks

# Tạo documentation
> generate JSDoc comments for all functions in utils.js

> create a comprehensive README.md for this project
```

#### Git workflows

```bash
> review my git changes before committing

> create a git commit with descriptive message

> help me resolve this merge conflict

> create a pull request description based on my changes
```

#### Tạo features mới

```bash
> add a new API endpoint for user profile management

> implement user authentication with JWT

> create a dashboard component with React and Tailwind
```

### Ví dụ workflow hoàn chỉnh

#### Tạo project mới từ đầu

```bash
# Tạo thư mục
mkdir todo-app
cd todo-app

# Khởi động Claude
claude

# Chat với Claude
> Create a Python Flask todo list application with the following:
- SQLite database
- RESTful API endpoints
- Basic HTML/CSS frontend using Tailwind
- User authentication
- CRUD operations for todos

Create the initial code as just the skeleton. I will ask you to implement each feature one by one.

# Claude sẽ tạo cấu trúc project

# Tiếp tục develop
> implement the user registration and login functionality

> add the ability to create, read, update, and delete todos

> add filtering and sorting for the todo list

> write unit tests for all API endpoints
```

#### Làm việc với existing project

```bash
cd ~/projects/existing-app
claude

# Hiểu codebase
> please analyze this codebase and create a CLAUDE.md file that explains:
- Overall architecture
- Key components and their responsibilities
- Tech stack used
- How to run and test the application

# Bug fixing
> I'm getting a 500 error when calling /api/users. Can you investigate and fix?

# Feature addition
> Add pagination to the users list API endpoint

# Code review
> review the changes I made in the last commit and suggest improvements
```

### Tạo file CLAUDE.md cho project

File này giúp Claude hiểu rõ hơn về project của bạn:

```bash
# Tạo file .claude/CLAUDE.md trong project root
```

Nội dung mẫu:

```markdown
# Project: My Awesome App

## Tech Stack
- Frontend: React 18, TypeScript, Tailwind CSS
- Backend: Node.js, Express, PostgreSQL
- Testing: Jest, React Testing Library

## Coding Standards
- Use TypeScript strict mode
- Follow Airbnb style guide
- Write tests for all new features
- Use functional components with hooks

## Important Notes
- Always run `npm run lint` before committing
- Database migrations are in `/migrations`
- API documentation at `/docs/api.md`

## Deployment
- Staging: Auto-deploy from `develop` branch
- Production: Manual deploy from `main` branch
```

---

## 💡 TIPS & TRICKS

### 1. Sử dụng Rewind feature (v2.0.0+)

```bash
# Nếu Claude làm sai, quay lại trạng thái trước
# Nhấn ESC 2 lần
# Hoặc gõ:
/rewind
```

### 2. Auto-approve mode (Cẩn thận!)

```bash
# Trong ~/.claude/settings.json
{
  "autoApprove": true  # Claude sẽ tự động thực hiện changes
}
```

**Lưu ý**: Chỉ dùng khi bạn tin tưởng hoàn toàn và đang làm việc với throwaway code.

### 3. Multiple models cho các tasks khác nhau

```bash
# Task phức tạp - dùng Opus
export ANTHROPIC_MODEL="claude-opus-4-20250514"
claude

# Task đơn giản - dùng Haiku (rẻ hơn)
export ANTHROPIC_MODEL="claude-3-5-haiku-20241022"
claude
```

### 4. Project-specific settings

Tạo `.claude/settings.json` trong project:

```json
{
  "model": "claude-sonnet-4-5-20250929",
  "editorPreference": "code",
  "autoApprove": false,
  "includeHiddenFiles": false
}
```

### 5. Tối ưu chi phí

- Sử dụng `/compact` để giảm context khi conversation dài
- Dùng `/clear` để bắt đầu fresh khi đổi task
- Với API: Monitor usage tại console.anthropic.com
- Với Claude Max: Unlimited messages (trong giới hạn rate limit)

### 6. Làm việc với large codebases

```bash
> focus on the /src/components directory only

> ignore the /node_modules and /build directories

> analyze only the backend API code in /api
```

### 7. Template prompts

Tạo file template cho các task thường làm:

```bash
# ~/claude-templates/feature-template.md
Create a new feature with the following:
1. API endpoint in Express
2. React component for UI
3. Unit tests
4. Update API documentation

Feature name: [NAME]
Description: [DESCRIPTION]
```

Dùng:
```bash
> Read ~/claude-templates/feature-template.md and implement a user profile feature
```

---

## 🔧 TROUBLESHOOTING

### Lỗi "command not found: claude"

**Nguyên nhân**: PATH không được cấu hình đúng

**Giải pháp**:

```bash
# Check PATH
echo $PATH

# Thêm vào ~/.bashrc hoặc ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"
# Hoặc với npm global
export PATH="$HOME/.npm-global/bin:$PATH"

# Reload
source ~/.bashrc  # hoặc source ~/.zshrc
```

### Lỗi permission khi cài npm global

**Nguyên nhân**: Cài npm package với sudo

**Giải pháp**: KHÔNG BAO GIỜ dùng sudo với npm

```bash
# Xóa cài đặt cũ
npm uninstall -g @anthropic-ai/claude-code

# Setup lại npm
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Cài lại
npm install -g @anthropic-ai/claude-code
```

### Claude Code không khởi động trên Windows

**Nguyên nhân**: Chạy trên Windows CMD/PowerShell thay vì WSL

**Giải pháp**:
1. Mở **Ubuntu** từ Start Menu (KHÔNG phải Command Prompt)
2. Chạy `claude` trong Ubuntu terminal

### Search functionality không hoạt động

**Nguyên nhân**: Thiếu ripgrep

**Giải pháp**:

```bash
# Ubuntu/Debian
sudo apt-get install ripgrep

# macOS
brew install ripgrep

# Verify
rg --version
```

### OAuth không hoạt động

**Triệu chứng**: Browser không mở hoặc không redirect về

**Giải pháp**:

```bash
# Option 1: Thử browser khác
# Copy URL từ terminal và paste vào browser

# Option 2: Dùng API key thay vì OAuth
export ANTHROPIC_API_KEY="your-api-key"
```

### Rate limit errors

**Triệu chứng**: "Rate limit exceeded"

**Giải pháp**:

**Với Claude Max**:
- Đợi 5 giờ để reset
- Upgrade plan nếu cần more usage

**Với API**:
- Check usage tại console.anthropic.com
- Tăng rate limits trong console
- Hoặc đợi cooldown period

### Claude tạo file sai thư mục

**Giải pháp**:

```bash
# Luôn specify đường dẫn rõ ràng
> create src/components/Header.jsx

# Hoặc cd vào đúng folder trước
cd src/components
claude
> create Header.jsx
```

### Update lỗi

**Triệu chứng**: Claude Code không tự update

**Giải pháp**:

```bash
# Check version
claude --version

# Manual update với native installer
curl -fsSL https://claude.ai/install.sh | bash

# Hoặc với npm
npm update -g @anthropic-ai/claude-code
```

### WSL 2 chậm khi access Windows files

**Nguyên nhân**: Performance overhead khi access cross-filesystem

**Giải pháp**:

**Option 1**: Làm việc trong WSL filesystem
```bash
# Tạo project trong WSL
cd ~/projects
mkdir my-app
```

**Option 2**: Optimize WSL config
```ini
# C:\Users\YourUsername\.wslconfig
[wsl2]
memory=8GB
processors=4
```

### API costs cao

**Giải pháp**:

1. **Monitor usage**:
   - Console: https://console.anthropic.com/settings/cost
   
2. **Optimize prompts**:
   ```bash
   # Thay vì:
   > explain every single line in this 1000-line file
   
   # Dùng:
   > explain the main function logic in app.py
   ```

3. **Sử dụng /compact**:
   ```bash
   /compact  # Summarize và giảm context
   ```

4. **Xem xét Claude Max**:
   - Nếu dùng > $20/tháng → Claude Max rẻ hơn

### Git integration không hoạt động

**Nguyên nhân**: Git chưa được cài hoặc cấu hình

**Giải pháp**:

```bash
# Check git
git --version

# Cài git nếu chưa có
# Ubuntu:
sudo apt-get install git

# macOS:
brew install git

# Configure git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## 📚 TÀI LIỆU THAM KHẢO

### Official Documentation
- **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code
- **Anthropic Console**: https://console.anthropic.com
- **API Documentation**: https://docs.anthropic.com

### Support
- **Support Portal**: https://support.claude.com
- **GitHub Issues**: Search "Claude Code" issues on GitHub
- **Community Forums**: Anthropic Discord, Reddit r/ClaudeAI

### Pricing
- **Claude Max**: ~$20/month (giá có thể thay đổi)
- **API Pricing**: https://www.anthropic.com/pricing

---

## ✅ CHECKLIST CÀI ĐẶT

### macOS
- [ ] Chạy native installer: `curl -fsSL https://claude.ai/install.sh | bash`
- [ ] Verify: `claude --version`
- [ ] Authenticate khi chạy lần đầu
- [ ] (Optional) Cài VS Code extension

### Windows
- [ ] Cài WSL 2: `wsl --install`
- [ ] Restart máy
- [ ] Mở Ubuntu, setup user/password
- [ ] Update: `sudo apt update && sudo apt upgrade -y`
- [ ] Cài Claude Code: `curl -fsSL https://claude.ai/install.sh | bash`
- [ ] Verify: `claude --version`
- [ ] Authenticate
- [ ] (Optional) Cài Windows Terminal
- [ ] (Optional) Cài VS Code + Remote WSL extension

### Linux
- [ ] Cài Claude Code: `curl -fsSL https://claude.ai/install.sh | bash`
- [ ] Verify: `claude --version`
- [ ] Authenticate
- [ ] (Optional) Cài VS Code extension

### Tất cả platforms
- [ ] Setup API key hoặc Claude Max subscription
- [ ] Test basic commands: `/help`, `/config`
- [ ] Tạo test project và thử generate code
- [ ] Đọc CLAUDE.md trong project (nếu có)
- [ ] Join Anthropic community để học tips

---

## 🎓 KẾT LUẬN

Claude Code là công cụ mạnh mẽ giúp tăng năng suất coding lên 3-5 lần. Với hướng dẫn này, bạn đã có đầy đủ kiến thức để:

1. ✅ Cài đặt Claude Code trên bất kỳ nền tảng nào
2. ✅ Tích hợp với IDE yêu thích
3. ✅ Sử dụng hiệu quả trong workflow hàng ngày
4. ✅ Troubleshoot các vấn đề thường gặp

**Next Steps**:
1. Thử Claude Code với 1 project nhỏ
2. Học thêm advanced features từ docs
3. Tham gia community để chia sẻ tips
4. Tối ưu workflow của riêng bạn

**Happy Coding with Claude! 🚀**

---

**Tài liệu được tạo bởi**: AI Assistant  
**Phiên bản**: 1.0  
**Cập nhật**: November 2024  
**Ngôn ngữ**: Tiếng Việt

*Lưu ý: Hướng dẫn này dựa trên thông tin chính thức từ Anthropic. Một số chi tiết có thể thay đổi theo thời gian. Luôn kiểm tra docs.claude.com để có thông tin mới nhất.*
