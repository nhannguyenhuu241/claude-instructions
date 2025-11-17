# CLAUDE CODE - PROMPT TEMPLATES & BEST PRACTICES
## Các mẫu prompts hiệu quả và best practices

---

## 📝 PROMPT TEMPLATES

### 1. KHỞI TẠO PROJECT MỚI

```
Tạo một [TYPE] application với các tính năng sau:
- [Feature 1]
- [Feature 2]
- [Feature 3]

Tech stack:
- Frontend: [Framework]
- Backend: [Framework]
- Database: [Database]
- Testing: [Framework]

Yêu cầu:
1. Tạo cấu trúc folder chuẩn
2. Thêm README.md với hướng dẫn setup
3. Thêm .gitignore phù hợp
4. Tạo CLAUDE.md giải thích architecture

Ban đầu chỉ tạo skeleton code. Tôi sẽ yêu cầu implement từng feature sau.
```

**Ví dụ cụ thể**:
```
Tạo một Todo List Web App với các tính năng sau:
- User authentication (register, login, logout)
- CRUD operations cho todos
- Filter và sort todos
- Mark as complete/incomplete
- Due date management

Tech stack:
- Frontend: React 18 + TypeScript + Tailwind CSS
- Backend: Node.js + Express + TypeScript
- Database: PostgreSQL
- Testing: Jest + React Testing Library

Yêu cầu:
1. Tạo cấu trúc folder chuẩn
2. Thêm README.md với hướng dẫn setup
3. Thêm .gitignore cho Node.js
4. Tạo CLAUDE.md giải thích architecture
5. Setup Docker cho development

Ban đầu chỉ tạo skeleton code với routing và database schema.
```

---

### 2. PHÂN TÍCH EXISTING CODEBASE

```
Hãy phân tích codebase này và tạo một file CLAUDE.md chi tiết bao gồm:

1. **Architecture Overview**
   - Overall structure
   - Design patterns used
   - Main components và responsibilities

2. **Tech Stack**
   - Frontend technologies
   - Backend technologies
   - Database và ORM
   - Testing frameworks
   - Build tools

3. **Project Structure**
   - Folder organization
   - Key files và purposes
   - Configuration files

4. **Development Workflow**
   - How to setup locally
   - How to run tests
   - How to build for production
   - Deployment process

5. **Coding Standards**
   - Code style guidelines
   - Naming conventions
   - Best practices followed

6. **Dependencies**
   - Key dependencies và purposes
   - Potential updates needed

7. **Improvement Suggestions**
   - Code quality issues
   - Security concerns
   - Performance optimization opportunities
```

---

### 3. FEATURE DEVELOPMENT

```
Implement feature: [FEATURE_NAME]

Requirements:
1. [Requirement 1]
2. [Requirement 2]
3. [Requirement 3]

Technical specs:
- [Spec 1]
- [Spec 2]

Acceptance criteria:
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Documentation updated

Implementation steps:
1. Create API endpoint(s)
2. Add business logic
3. Create UI components
4. Add validation
5. Write tests
6. Update documentation
```

**Ví dụ**:
```
Implement feature: User Profile Management

Requirements:
1. Users can view their profile
2. Users can edit: name, email, bio, avatar
3. Email must be validated before saving
4. Avatar upload with size/format validation

Technical specs:
- RESTful API: GET /api/profile, PUT /api/profile
- File upload endpoint: POST /api/profile/avatar
- Max avatar size: 5MB
- Allowed formats: jpg, png, webp
- Store in S3/CloudStorage

Acceptance criteria:
- [ ] Profile page shows all user data
- [ ] Edit form validates inputs
- [ ] Email verification email sent on email change
- [ ] Avatar uploads and displays correctly
- [ ] Error handling for all edge cases
- [ ] Unit tests coverage > 80%
- [ ] API documentation updated

Implementation steps:
1. Create profile endpoints in Express
2. Add profile controller with validation
3. Create React profile page component
4. Add file upload handling
5. Write unit & integration tests
6. Update API docs in Swagger
```

---

### 4. BUG FIXING

```
Fix bug: [BUG_DESCRIPTION]

Current behavior:
[Mô tả chi tiết bug hiện tại]

Expected behavior:
[Mô tả behavior đúng]

Steps to reproduce:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Error messages/logs:
```
[Paste error logs here]
```

Investigation requests:
1. Tìm root cause của bug
2. Check các edge cases liên quan
3. Suggest fix và explain rationale
4. Add tests để prevent regression
```

---

### 5. CODE REFACTORING

```
Refactor: [COMPONENT/MODULE_NAME]

Current issues:
- [Issue 1]
- [Issue 2]

Goals:
- [ ] Improve readability
- [ ] Reduce complexity
- [ ] Follow [PATTERN] pattern
- [ ] Better error handling
- [ ] Add type safety
- [ ] Improve performance

Constraints:
- Maintain backward compatibility
- Keep existing tests passing
- No breaking changes to API

Please:
1. Analyze current code structure
2. Suggest refactoring approach
3. Implement incrementally
4. Update tests as needed
5. Document changes
```

---

### 6. TESTING

```
Add comprehensive tests for: [MODULE_NAME]

Test types needed:
- [ ] Unit tests for individual functions
- [ ] Integration tests for API endpoints
- [ ] E2E tests for user workflows

Coverage requirements:
- Minimum 80% code coverage
- All edge cases covered
- Error scenarios tested

Test scenarios to include:
1. Happy path
2. Invalid inputs
3. Boundary conditions
4. Error handling
5. Authentication/authorization
6. Concurrent requests (if applicable)

Please:
- Use [TESTING_FRAMEWORK]
- Follow existing test patterns
- Add setup/teardown if needed
- Mock external dependencies
```

---

### 7. CODE REVIEW

```
Review my recent changes:

Files changed:
[List files hoặc git diff]

Questions:
1. Are there any code quality issues?
2. Any security concerns?
3. Performance implications?
4. Best practices violations?
5. Missing error handling?
6. Need more tests?

Please provide:
- Specific improvement suggestions
- Code snippets for fixes
- Explanation of concerns
- Priority level for each issue
```

---

### 8. DOCUMENTATION

```
Generate documentation for: [COMPONENT/API/MODULE]

Include:
1. **Overview**: Purpose và functionality
2. **Installation/Setup**: Step-by-step guide
3. **Usage Examples**: Code examples cho common use cases
4. **API Reference**: 
   - Functions/methods with parameters
   - Return values
   - Error scenarios
5. **Configuration**: Available options
6. **Troubleshooting**: Common issues và solutions
7. **Best Practices**: Recommended usage patterns

Format: [Markdown/JSDoc/OpenAPI/etc.]
```

---

### 9. PERFORMANCE OPTIMIZATION

```
Optimize performance of: [COMPONENT/FEATURE]

Current metrics:
- Load time: [time]
- Memory usage: [amount]
- Database queries: [count]
- API response time: [time]

Target metrics:
- Load time: < [target]
- Memory usage: < [target]
- Reduce query count by [X]%
- API response: < [target]

Focus areas:
1. [ ] Database query optimization
2. [ ] Caching implementation
3. [ ] Code efficiency
4. [ ] Bundle size reduction
5. [ ] Lazy loading
6. [ ] Resource compression

Please:
- Profile current performance
- Identify bottlenecks
- Suggest specific optimizations
- Implement changes
- Measure improvements
```

---

### 10. DATABASE MIGRATIONS

```
Create database migration for: [CHANGE_DESCRIPTION]

Changes needed:
1. [Change 1]
2. [Change 2]

Requirements:
- Zero-downtime deployment
- Rollback capability
- Data preservation
- Index optimization

Please create:
1. Up migration script
2. Down migration script
3. Seed data if needed
4. Update ORM models
5. Test migration locally
```

---

## 🎯 BEST PRACTICES

### 1. Viết Prompts Hiệu Quả

#### ✅ TỐT
```
Create a REST API endpoint POST /api/users with the following:
- Accept JSON: { name, email, password }
- Validate email format
- Hash password with bcrypt
- Save to PostgreSQL
- Return JWT token
- Handle duplicate email error
- Add unit tests
```

#### ❌ KHÔNG TỐT
```
make user api
```

**Nguyên tắc**:
- Cụ thể, chi tiết
- Liệt kê requirements rõ ràng
- Đề cập tech stack
- Bao gồm validation/error handling
- Yêu cầu tests

---

### 2. Chia Nhỏ Tasks

#### ✅ Làm Từng Bước
```bash
# Bước 1
> Create user authentication API endpoints

# Bước 2
> Add JWT token generation and validation

# Bước 3
> Create login/register UI components

# Bước 4
> Add form validation

# Bước 5
> Write tests for authentication flow
```

#### ❌ Làm Cùng Lúc
```bash
> Build complete user authentication system with all features
```

**Lợi ích**:
- Dễ debug khi có vấn đề
- Review code từng phần
- Linh hoạt điều chỉnh
- Ít token hơn

---

### 3. Cung Cấp Context

#### ✅ Có Context
```
In the Express app using TypeScript and PostgreSQL with TypeORM:

Add a new endpoint GET /api/orders/:id that:
- Fetches order with related items
- Includes user information
- Formats currency properly
- Handles not found case
```

#### ❌ Thiếu Context
```
add get order endpoint
```

---

### 4. Sử dụng CLAUDE.md

Tạo file `.claude/CLAUDE.md` trong project:

```markdown
# Project: E-commerce Platform

## Tech Stack
- Frontend: Next.js 14, TypeScript, Tailwind
- Backend: Node.js, Express, Prisma ORM
- Database: PostgreSQL
- Auth: NextAuth.js
- Payment: Stripe

## Code Style
- Use TypeScript strict mode
- Follow Airbnb style guide
- Functional components with hooks
- Use async/await, no callbacks
- Prefer named exports

## Important Patterns
- API routes in /pages/api
- React components in /components
- Utilities in /lib
- Types in /types

## Testing
- Jest for unit tests
- React Testing Library for components
- Minimum 80% coverage

## Git Workflow
- Feature branches from develop
- PR requires review + tests passing
- Squash merge to develop

## Deployment
- Vercel for frontend
- Railway for backend
- Automated from main branch
```

**Claude sẽ tự động tham khảo file này!**

---

### 5. Version Control Best Practices

```bash
# Trước khi commit
> review my changes and suggest improvements

# Create commit message
> create a conventional commit message for these changes

# Before PR
> generate a pull request description for these changes
```

---

### 6. Xử Lý Errors

```bash
# Khi gặp error
> This error occurred: [paste error]
> File: [filename]
> Line: [line number]
> What I was trying to do: [explanation]
> 
> Please help me fix it and explain why it happened.
```

---

### 7. Tối Ưu Chi Phí

```bash
# Thay vì hỏi chung chung
❌ > explain everything in this 5000-line file

# Hỏi cụ thể
✅ > explain the authentication middleware in auth.js

# Sử dụng /compact khi cần
/compact

# Clear khi đổi context hoàn toàn
/clear
```

---

### 8. Testing Workflow

```bash
# Tạo tests từ đầu
> create comprehensive tests for UserService including:
> - Happy path scenarios
> - Error cases
> - Edge cases
> - Mock database calls

# Chạy và fix tests
> run the tests and fix any failures

# Check coverage
> show me the test coverage report
```

---

### 9. Làm Việc Với Legacy Code

```bash
# Hiểu code cũ trước
> analyze this legacy code and explain:
> 1. What it does
> 2. Potential issues
> 3. How to refactor safely

# Refactor từng phần
> refactor the validateUser function to use async/await
> keep the same behavior, add proper error handling

# Add tests cho code cũ
> add tests for the existing login function before we refactor it
```

---

### 10. Documentation Workflow

```bash
# API docs
> generate OpenAPI/Swagger spec for all API endpoints in routes/api

# Code comments
> add JSDoc comments to all functions in utils/helpers.js

# README
> create a comprehensive README.md with:
> - Project description
> - Setup instructions
> - Development guide
> - API documentation
> - Deployment process
```

---

## 💡 ADVANCED TIPS

### 1. Multi-file Operations

```bash
> refactor the authentication logic:
> 1. Move validation to src/validators/auth.validator.ts
> 2. Move middleware to src/middleware/auth.middleware.ts
> 3. Update imports in all affected files
> 4. Ensure all tests still pass
```

### 2. Database Operations

```bash
> create a Prisma migration that:
> 1. Adds 'lastLoginAt' timestamp to User table
> 2. Creates index on email field
> 3. Updates User model
> 4. Generates migration file
> 5. Show me how to run it
```

### 3. Complex Features

```bash
> implement search functionality:
> 
> Requirements:
> - Full-text search across products (name, description, tags)
> - Filter by category, price range, rating
> - Sort by relevance, price, date
> - Pagination (20 items per page)
> - Response time < 200ms
> 
> Implementation:
> 1. Create Elasticsearch index
> 2. Add search API endpoint
> 3. Create React search component with filters
> 4. Add debounced input
> 5. Implement infinite scroll
> 6. Add loading states
> 7. Write tests
```

### 4. Security Audit

```bash
> perform security audit on authentication system:
> 
> Check for:
> 1. SQL injection vulnerabilities
> 2. XSS vulnerabilities
> 3. CSRF protection
> 4. Password strength requirements
> 5. Rate limiting on login
> 6. Secure session management
> 7. Input validation
> 8. Proper error messages (no info leakage)
> 
> Provide specific findings and fixes.
```

### 5. Performance Profiling

```bash
> profile the /api/dashboard endpoint:
> 
> Current issues:
> - Response time: 2.5s
> - 15 database queries
> - Large JSON response (500KB)
> 
> Optimize by:
> 1. Reducing query count (use joins)
> 2. Add caching layer
> 3. Implement pagination
> 4. Remove unnecessary fields
> 5. Add compression
> 
> Target: < 500ms response time
```

---

## 🚨 COMMON MISTAKES TO AVOID

### ❌ Mistake 1: Vague Prompts
```
make it better
```

### ✅ Correct:
```
improve the error handling in login.js by:
1. Adding specific error messages for each failure case
2. Implementing retry logic for network errors
3. Logging errors with proper context
```

---

### ❌ Mistake 2: Không Review Changes
```
# Chấp nhận mọi thay đổi mà không xem
```

### ✅ Correct:
```bash
# Luôn review
> show me the changes you made

# Test trước khi commit
> run tests to verify changes
```

---

### ❌ Mistake 3: Không Cung Cấp Error Context
```
it doesn't work
```

### ✅ Correct:
```
I'm getting this error when calling login API:

Error: 
```
TypeError: Cannot read property 'password' of undefined
  at login (controllers/auth.js:25)
```

Request payload:
```json
{
  "email": "test@example.com",
  "password": "password123"
}
```

Expected: Return JWT token
Actual: Server crashes
```

---

### ❌ Mistake 4: Quá Nhiều Changes Cùng Lúc
```
refactor entire codebase to use TypeScript, add tests, update all dependencies, change database, redesign UI
```

### ✅ Correct:
```
Step 1: Convert auth module to TypeScript
Step 2: Add tests for auth
Step 3: (sau khi xác nhận step 1-2 OK) migrate user module
```

---

## 📊 WORKFLOW EXAMPLES

### Workflow 1: New Feature End-to-End

```bash
# 1. Phân tích requirements
> I need to add a "favorites" feature where users can save products.
> What do I need to implement?

# 2. Database schema
> create Prisma schema for favorites feature

# 3. API endpoints
> create REST API endpoints for favorites:
> - POST /api/favorites (add to favorites)
> - DELETE /api/favorites/:id (remove)
> - GET /api/favorites (list user favorites)

# 4. Frontend
> create React components for favorites:
> - FavoriteButton component
> - FavoritesList page
> - Use React Query for data fetching

# 5. Tests
> add tests for favorites feature

# 6. Documentation
> update API docs with favorites endpoints

# 7. Review
> review all changes and create a git commit message
```

---

### Workflow 2: Bug Investigation và Fix

```bash
# 1. Report bug
> Bug: Users are being logged out randomly
> 
> Symptoms:
> - Session expires unexpectedly
> - Happens after ~10 minutes
> - Only in production
> 
> Investigate and suggest fixes

# 2. Analyze
> check the session configuration in production vs development

# 3. Fix
> implement the suggested fix for session timeout

# 4. Test
> how can I test this fix locally?

# 5. Deploy
> create a deployment checklist for this fix
```

---

### Workflow 3: Code Review và Refactoring

```bash
# 1. Initial review
> review the UserService.js file and suggest improvements

# 2. Refactor
> refactor UserService to use async/await instead of callbacks

# 3. Add types
> add TypeScript types to UserService

# 4. Tests
> ensure all existing tests still pass, add new ones if needed

# 5. Documentation
> update JSDoc comments with new async signatures
```

---

## 🎓 LEARNING RESOURCES

### Tài liệu nên đọc:
1. **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code
2. **Prompt Engineering Guide**: https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering
3. **Best Practices**: Community forums và GitHub discussions

### Practice Projects:
1. Todo App (Beginner)
2. Blog Platform (Intermediate)
3. E-commerce Site (Advanced)
4. Real-time Chat App (Advanced)

---

**Happy Coding! 🚀**

*File này chứa các templates và best practices được tổng hợp từ kinh nghiệm thực tế. Customize theo workflow của riêng bạn!*
