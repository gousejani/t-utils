#!/bin/bash 

if [[ -n "$TODOS_DIR" ]]; then 
    TODOS_DIR="$TODOS_DIR" 
else 
    TODOS_DIR="$HOME/.todos" 
fi 

mkdir -p "$TODOS_DIR" 

TODO="$TODOS_DIR/todo" 
COMPLETED="$TODOS_DIR/completed" 

# we will have a todo files which will have all todos 
# we will have a todo completed file which will have all todos completed 
# when todo is marked completed we have to remove it from todos file and move it to todos completed 
# 
# TODO: priority ?? how to handle it ? 

add_todo() { 
    local message="$1" 
    echo "$message" >> "$TODO" 
} 

show_todo() { 
    cat "$TODO" 
} 

open_todos(){ 
    nvim "$TODO" 
} 

ACTION="default" 

while getopts ":a:o" opt; do 
    case "$opt" in 
        a) 
            ACTION="add" 
            MESSAGE="$OPTARG" 
            ;; 
        o) 
            ACTION="open" 
            ;; 
        :) 
            echo "Option -$OPTARG requires a value" 
            exit 1 
            ;; 
        \?) 
            echo "Invalid option: -$OPTARG" 
            exit 1 
            ;; 
    esac 
done 

case "$ACTION" in 
    default) 
        show_todo 
        ;; 
    add) 
        echo "add todo" 
        add_todo "$MESSAGE" 
        ;; 
    open) 
        echo "opening todos file" 
        open_todos 
        ;; 
esac
