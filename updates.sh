#!/bin/bash 

if [[ -n "$UPDATE_DIR" ]]; then 
    UPDATE_DIR="$UPDATE_DIR" 
else 
    UPDATE_DIR="$HOME/.updates" 
fi 

mkdir -p "$UPDATE_DIR" 

get_date () { 
    # TODO: support for all os 
    local days="${1-0}" 
    date -v-"${days}"d +%Y-%m-%d 
} 

add_update() { 
    local message="$1" 
    local days="${2-0}" 
    local da=$(get_date "$days") 
    local file="$UPDATE_DIR/$da" 
    local time=$(date +"%Y-%m-%d %H:%M:%S") 
    echo "$time $message" >> "$file" 
} 

get_updates() { 
    local days="${1-0}" 
    local da=$(get_date "$days") 
    local file="$UPDATE_DIR/$da" 
    cat "$file"; 
} 

while getopts "a:gd:" opt; do 
    case "$opt" in 
        a) 
            ACTION="add" 
            MESSAGE="$OPTARG" 
            ;; 
        g) 
            ACTION="get" 
            ;; 
        d) 
            DAYS_AGO="$OPTARG" 
            ;; 
        *) 
            echo "wrong usage one" 
            exit 1 
            ;; 
    esac 
done 

case "$ACTION" in 
    add) 
        echo "updating message" 
        add_update "$MESSAGE" 0 
        ;; 
    get) 
        echo "getting messages" 
        get_updates "${DAYS_AGO-0}" 
        ;; 
    *) 
        echo "wrong usage two" 
        exit 1 
        ;; 
esac
