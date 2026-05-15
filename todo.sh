#!/bin/bash

# ============================================
#   To-Do List Application - CPE212/EC342
#   Operating Systems Project - Spring 2026
# ============================================

TASKS_FILE="tasks.csv"

# ---------- Initialize File ----------
init_file() {
    if [ ! -f "$TASKS_FILE" ]; then
        echo "ID,Title,Status,Date" > "$TASKS_FILE"
    fi
}

# ---------- Get Next ID ----------
get_next_id() {
    local count
    count=$(tail -n +2 "$TASKS_FILE" | wc -l)
    echo $(( count + 1 ))
}

# ---------- Add Task ----------
add_task() {
    echo ""
    echo "=== Add New Task ==="

    read -rp "Enter task title: " title
    if [ -z "$title" ]; then
        echo "[ERROR] Title cannot be empty."
        return
    fi

    read -rp "Enter due date (YYYY-MM-DD) or press Enter to skip: " date
    if [ -z "$date" ]; then
        date="N/A"
    elif [[ ! "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "[ERROR] Invalid date format. Please use YYYY-MM-DD."
        return
    fi

    local id
    id=$(get_next_id)

    echo "$id,$title,Pending,$date" >> "$TASKS_FILE"
    echo "[SUCCESS] Task #$id added."
}

# ---------- View Tasks ----------
view_tasks() {
    echo ""
    echo "=== Task List ==="
    echo ""

    # Load lines into array
    mapfile -t lines < <(tail -n +2 "$TASKS_FILE")

    if [ ${#lines[@]} -eq 0 ]; then
        echo "No tasks found."
        return
    fi

    printf "%-4s  %-25s  %-11s  %-12s\n" "ID" "Title" "Status" "Date"
    echo "------------------------------------------------------"

    for line in "${lines[@]}"; do
        id=$(echo "$line"     | cut -d',' -f1)
        title=$(echo "$line"  | cut -d',' -f2)
        status=$(echo "$line" | cut -d',' -f3)
        date=$(echo "$line"   | cut -d',' -f4)
        printf "%-4s  %-25s  %-11s  %-12s\n" "$id" "$title" "$status" "$date"
    done
    echo ""
}

# ---------- Edit Task ----------
edit_task() {
    view_tasks
    read -rp "Enter task ID to edit: " id

    if ! grep -q "^$id," "$TASKS_FILE"; then
        echo "[ERROR] Task #$id not found."
        return
    fi

    old=$(grep "^$id," "$TASKS_FILE")
    old_title=$(echo "$old" | cut -d',' -f2)
    old_date=$(echo "$old"  | cut -d',' -f4)
    old_status=$(echo "$old" | cut -d',' -f3)

    read -rp "New title [$old_title]: " new_title
    [ -z "$new_title" ] && new_title="$old_title"

    read -rp "New date [$old_date]: " new_date
    if [ -z "$new_date" ]; then
        new_date="$old_date"
    elif [[ ! "$new_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "[ERROR] Invalid date format. Please use YYYY-MM-DD."
        return
    fi

    # Rewrite file
    tmp=$(mktemp)
    while IFS= read -r line; do
        if [[ "$line" == "$id,"* ]]; then
            echo "$id,$new_title,$old_status,$new_date"
        else
            echo "$line"
        fi
    done < "$TASKS_FILE" > "$tmp"
    mv "$tmp" "$TASKS_FILE"

    echo "[SUCCESS] Task #$id updated."
}

# ---------- Delete Task ----------
delete_task() {
    view_tasks
    read -rp "Enter task ID to delete: " id

    if ! grep -q "^$id," "$TASKS_FILE"; then
        echo "[ERROR] Task #$id not found."
        return
    fi

    tmp=$(mktemp)
    grep -v "^$id," "$TASKS_FILE" > "$tmp"
    mv "$tmp" "$TASKS_FILE"

    echo "[SUCCESS] Task #$id deleted."
}

# ---------- Mark Task as Completed ----------
mark_completed() {
    view_tasks
    read -rp "Enter task ID to mark as completed: " id

    if ! grep -q "^$id," "$TASKS_FILE"; then
        echo "[ERROR] Task #$id not found."
        return
    fi

    tmp=$(mktemp)
    while IFS= read -r line; do
        if [[ "$line" == "$id,"* ]]; then
            t=$(echo "$line" | cut -d',' -f2)
            d=$(echo "$line" | cut -d',' -f4)
            echo "$id,$t,Completed,$d"
        else
            echo "$line"
        fi
    done < "$TASKS_FILE" > "$tmp"
    mv "$tmp" "$TASKS_FILE"

    echo "[SUCCESS] Task #$id marked as Completed."
}

# ---------- Main Menu ----------
show_menu() {
    echo ""
    echo "==============================="
    echo "     TO-DO LIST APPLICATION    "
    echo "==============================="
    echo "  1) Add Task"
    echo "  2) View Tasks"
    echo "  3) Edit Task"
    echo "  4) Delete Task"
    echo "  5) Mark Task as Completed"
    echo "  6) Exit"
    echo "==============================="
    echo -n "  Choose an option [1-6]: "
}

# ---------- Entry Point ----------
init_file

while true; do
    show_menu
    read -r choice

    case $choice in
        1) add_task ;;
        2) view_tasks ;;
        3) edit_task ;;
        4) delete_task ;;
        5) mark_completed ;;
        6)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "[ERROR] Invalid option."
            ;;
    esac
done