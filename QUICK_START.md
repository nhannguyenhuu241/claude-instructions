# CLAUDE CODE - QUICK START GUIDE
## Hướng dẫn nhanh 5 phút ⚡

---

## 🚀 CÀI ĐẶT NHANH

### macOS / Linux
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### Windows
```powershell
# Bước 1: Cài WSL 2 (PowerShell với quyền Admin)
wsl --install

# Bước 2: Restart máy và mở Ubuntu
# Bước 3: Trong Ubuntu terminal
curl -fsSL https://claude.ai/install.sh | bash
```

---

## ✅ KIỂM TRA CÀI ĐẶT

```bash
claude --version
claude doctor
```

---

## 🔐 XÁC THỰC (LẦN ĐẦU)

```bash
cd ~/your-project
claude

# Chọn: Claude Console (OAuth) hoặc API Key
# Làm theo hướng dẫn trên màn hình
```

---

## 📖 SỬ DỤNG CƠ BẢN

### Khởi động
```bash
cd ~/your-project
claude
```

### Lệnh cơ bản
```bash
/help       # Xem tất cả lệnh
/config     # Cấu hình
/clear      # Bắt đầu lại
/quit       # Thoát
```

### Ví dụ prompts
```bash
> explain this codebase

> create a Python Flask API with user authentication

> fix the bug in app.py

> add unit tests for UserService

> review my git changes and create a commit message
```

---

## 💡 TIPS

1. **Luôn cụ thể**: "create src/api/users.js" thay vì "create a file"
2. **Chia nhỏ tasks**: Làm từng feature một
3. **Dùng /compact**: Khi conversation quá dài
4. **Tạo CLAUDE.md**: Giải thích project cho Claude hiểu

---

## 🔧 TROUBLESHOOTING NHANH

| Vấn đề | Giải pháp |
|--------|-----------|
| "command not found" | `echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc` |
| Windows không chạy | Phải dùng Ubuntu terminal, KHÔNG phải CMD |
| OAuth failed | Dùng API key thay thế |
| Too expensive | Xem xét Claude Max subscription |

---

## 📚 ĐỌC THÊM

- **Full Guide**: HUONG_DAN_CLAUDE_CODE.md (trong cùng folder)
- **Docs**: https://docs.claude.com/en/docs/claude-code
- **Support**: https://support.claude.com

---

**🎉 Xong! Giờ bạn đã sẵn sàng code với AI!**
