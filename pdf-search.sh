#!/bin/bash

recursive=false

help_menu() {
    echo -e "\033[1mpdfsearch\033[0m - search for a string in all pdfs in a directory"
    echo ""
    echo -e "\033[1mpdfsearch\033[0m [options] [path] (stringToSearch)"
    echo ""
    echo -e "\033[1mOptions:\033[0m"
    echo "    -h, --help                Show brief help"
    echo "    -r, --recursive           Search in all subdirectories as well"
    echo ""
    echo -e "\033[1mArguments:\033[0m"
    echo "    path                      Directory where the script will search for pdfs (default: current directory)"
    echo "    stringToSearch            The string to search in the pdf files"
    exit 0
}

search_pdfs() {
    if [ "$recursive" = true ]; then
        results=($(find "$path" -name "*.pdf" -exec pdfgrep -nH "$string" {} + | awk -F: '{sub(/.*\//,""); print $1 ":" $2}'))
    else
        results=($(find "$path" -maxdepth 1 -name "*.pdf" -exec pdfgrep -nH "$string" {} + | awk -F: '{sub(/.*\//,""); print $1 ":" $2}'))
    fi
}

open_pdf(){
    if [ ${#results[@]} -eq 0 ]; then
        echo "No results found."
        exit 0
    fi

    PS3="Enter the number of the PDF you want to open: "
    select result in $(echo "${results[@]}" | tr ' ' '\n'); do
        file="${result%%:*}"
        if [ -f "$path/$file" ]; then
            xdg-open "$path/$file"
            break
        else
            echo "Invalid selection."
        fi
    done
}

parse_args() {
    echo "Parsing arguments: $@"
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        help_menu
    fi

    if [ "$1" = "-r" ] || [ "$1" = "--recursive" ]; then
        recursive=true
    else
        path="$1"
        string="$2"
    fi

    if [ -z "$string" ]; then
        echo "Please provide a string to search for."
        exit 1
    fi

    if [ -z "$path" ]; then
        path="./"
    fi
    echo "Path: $path, String: $string, Recursive: $recursive"
}

parse_args "$@"
search_pdfs
open_pdf
