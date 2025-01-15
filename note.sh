#!/bin/bash
 NOTES_FILE="$HOME/notes.txt"

case "$1" in
    add)
        [ -z "$2" ] && echo "Error: Note text cannot be empty." && exit 1
        echo "$(date +'%Y-%m-%d %H:%M:%S') - $2" >> "$NOTES_FILE"
        echo "Note added."
        ;;
    list)
        [ ! -f "$NOTES_FILE" ] && echo "No notes found." && exit 0
        cat "$NOTES_FILE"
        ;;
    search)
        [ -z "$2" ] && echo "Error: Keyword cannot be empty." && exit 1
        [ ! -f "$NOTES_FILE" ] && echo "No notes found." && exit 0
        grep -i "$2" "$NOTES_FILE" || echo "No matching notes found."
        ;;
    *)
        echo "Usage: $0 {add \"note text\" | list | search \"keyword\"}" && exit 1
        ;;
esac