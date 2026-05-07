# To-Do List Application — Bash
### CPE 212 / EC 342 | Operating Systems Project | Spring 2026
**Pharos University in Alexandria — Faculty of Engineering**

---

## 👥 Group Members
| Name | ID |
|------|----|
| [Your Name] | [Your ID] |
| [Partner Name] | [Partner ID] |

---

## 🚀 How to Run

**1. Clone or download the project files:**
```bash
git clone https://github.com/YOUR_USERNAME/todo-bash-app.git
cd todo-bash-app
```

**2. Give the script execute permission:**
```bash
chmod +x todo.sh
```

**3. Run the script:**
```bash
./todo.sh
```

---

## ✅ Implemented Features

| Feature | Description |
|---------|-------------|
| **Add Task** | Creates a task with a title and optional due date |
| **View Tasks** | Displays all tasks in a formatted, color-coded table |
| **Edit Task** | Modify the title or date of an existing task by ID |
| **Delete Task** | Remove a task by ID with confirmation prompt |
| **Mark as Completed** | Update a task's status to "Completed" |
| **Persistent Storage** | All tasks saved in `tasks.csv` (survives script restarts) |
| **Input Validation** | Validates IDs (numeric), dates (YYYY-MM-DD), and empty fields |
| **Error Handling** | Friendly error messages for all invalid inputs |

---

## 📋 Bash Concepts Used

- **Variables** — used for task fields (id, title, status, date) and file paths
- **Conditionals** — `if/elif/else` for validation; `case` for main menu
- **Loops** — `for` loop to iterate tasks; `while` loop for the main menu
- **Functions** — `add_task`, `view_tasks`, `edit_task`, `delete_task`, `mark_completed`, `init_file`
- **Arrays** — `mapfile -t lines` loads the CSV into a Bash array in `view_tasks`
- **File Handling** — `cut`, `grep`, `awk`, `mktemp`, redirection (`>>`, `>`) for CSV read/write
- **Input Validation & Error Handling** — date regex, numeric ID check, empty title guard

---

## 📁 File Structure

```
todo-app/
├── todo.sh       # Main Bash script
├── tasks.csv     # Persistent task storage (auto-created on first run)
└── README.md     # This file
```

---

## 📝 Special Usage Notes

- Tasks are stored in `tasks.csv` with the format: `ID,Title,Status,Date`
- If `tasks.csv` does not exist, it is **automatically created** on first run
- Commas in task titles are automatically replaced with semicolons to preserve CSV format
- Date format must be **YYYY-MM-DD** (e.g., `2026-05-18`) — or press Enter to skip
- Completed tasks are shown in **green**, pending tasks in **yellow** (requires a color-capable terminal)

---

## 🎁 Bonus

- Project uploaded to GitHub with a commit for each milestone/feature
