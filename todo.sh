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
        echo "Task file created: $TASKS_FILE"
    fi
}

# ---------- Add Task ----------
add_task() {
    echo ""
    echo "=== Add New Task ==="

    # Title validation
    while true; do
        read -rp "Enter task title: " title
        if [ -z "$title" ]; then
            echo "[ERROR] Title cannot be empty. Try again."
        else
            break
        fi
    done

    # Date validation
    while true; do
        read -rp "Enter due date (YYYY-MM-DD) or press Enter to skip: " date
        if [ -z "$date" ]; then
            date="N/A"
            break
        elif [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            break
        else
            echo "[ERROR] Invalid date format. Use YYYY-MM-DD."
        fi
    done

    local id
    id=$(get_next_id)
    local status="Pending"

    # Escape commas in title
    title="${title//,/;}"

    echo "$id,$title,$status,$date" >> "$TASKS_FILE"
    echo ""
    echo "[SUCCESS] Task #$id added: '$title' | Date: $date | Status: $status"
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
            echo ""
            echo "Goodbye! Stay productive."
            echo ""
            exit 0
            ;;
        *)
            echo "[ERROR] Invalid option. Please choose between 1 and 6."
            ;;
    esac
done
