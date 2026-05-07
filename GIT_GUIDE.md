# 📅 Day-by-Day GitHub Push Guide
## Todo App — CPE 212/EC 342 | VS Code + Git

---

## 🔧 ONE-TIME SETUP (Do this ONCE before Day 1)

### Step 1 — Install Git
Download from: https://git-scm.com/download/win
During install → choose "Use Git from VS Code terminal" ✅

### Step 2 — Create GitHub Account
Go to: https://github.com → Sign Up

### Step 3 — Create a New Repository on GitHub
1. Click the green **"New"** button
2. Repository name: `todo-bash-app`
3. Set to **Public**
4. Do NOT check "Initialize with README" (we already have one)
5. Click **"Create repository"**
6. **Copy the repo URL** — looks like:
   `https://github.com/YOUR_USERNAME/todo-bash-app.git`

### Step 4 — Open Your Project Folder in VS Code
1. Open VS Code
2. File → Open Folder → select your `todo-app` folder
3. Open the Terminal: **Ctrl + `** (backtick)

### Step 5 — Configure Git (one time only)
Paste these in the terminal (replace with your info):
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### Step 6 — Initialize Git & First Push
```bash
git init
git add .
git commit -m "Initial commit: project setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/todo-bash-app.git
git push -u origin main
```
✅ Done! Your files are now on GitHub.

---

## 📆 DAY 1 — Add the `add_task` function

**What you work on today:**
- Write the `add_task()` function
- Make sure title validation works
- Make sure date validation works

**After you finish coding, open VS Code terminal and run:**
```bash
git add .
git commit -m "Day 1: add_task function with input validation"
git push
```

---

## 📆 DAY 2 — Add the `view_tasks` function

**What you work on today:**
- Write the `view_tasks()` function
- Load CSV lines into a Bash array
- Print tasks in a formatted table

**VS Code terminal:**
```bash
git add .
git commit -m "Day 2: view_tasks function with array and formatted output"
git push
```

---

## 📆 DAY 3 — Add the `delete_task` function

**What you work on today:**
- Write the `delete_task()` function
- Add confirmation prompt before deleting
- Use grep/temp file to remove the task

**VS Code terminal:**
```bash
git add .
git commit -m "Day 3: delete_task function with confirmation"
git push
```

---

## 📆 DAY 4 — Add the `edit_task` function

**What you work on today:**
- Write the `edit_task()` function
- Let the user update title and/or date
- Keep old values if user presses Enter

**VS Code terminal:**
```bash
git add .
git commit -m "Day 4: edit_task function with field-by-field update"
git push
```

---

## 📆 DAY 5 — Add the `mark_completed` function

**What you work on today:**
- Write the `mark_completed()` function
- Use awk to update the status field
- Prevent marking already-completed tasks

**VS Code terminal:**
```bash
git add .
git commit -m "Day 5: mark_completed function using awk"
git push
```

---

## 📆 DAY 6 — Add the main menu + init function

**What you work on today:**
- Write `show_menu()` with a `case` statement
- Write `init_file()` to auto-create tasks.csv
- Connect all functions to the menu

**VS Code terminal:**
```bash
git add .
git commit -m "Day 6: main menu with case statement and init_file"
git push
```

---

## 📆 DAY 7 — Final testing + README + cleanup

**What you work on today:**
- Test every feature end-to-end
- Fill in your names and IDs in README.md
- Fix any bugs found during testing

**VS Code terminal:**
```bash
git add .
git commit -m "Day 7: final testing, bug fixes, README completed"
git push
```

---

## 🏁 SUBMISSION DAY (Before May 18, 2026 — 12:59 PM)

**Final push:**
```bash
git add .
git commit -m "Final submission: complete Todo App"
git push
```

Then:
1. Go to your GitHub repo page
2. Copy the URL (e.g. `https://github.com/YOUR_USERNAME/todo-bash-app`)
3. Submit on **Blackboard** with:
   - `todo.sh`
   - `tasks.csv`
   - `README.md`
   - Your GitHub repo link (for the bonus)

---

## 💡 Quick Git Cheat Sheet

| Command | What it does |
|---------|--------------|
| `git status` | See what files changed |
| `git add .` | Stage all changes |
| `git commit -m "message"` | Save a snapshot with a label |
| `git push` | Upload to GitHub |
| `git log --oneline` | See all your commits |

---

## ⚠️ Common Errors & Fixes

**"git is not recognized"**
→ Reinstall Git and check "Add to PATH" during install, then restart VS Code

**"remote: Repository not found"**
→ Double-check the URL you used in `git remote add origin ...`

**"src refspec main does not match"**
→ Make sure you ran `git commit` before `git push`

**"Updates were rejected"**
→ Run `git pull origin main` first, then `git push` again
