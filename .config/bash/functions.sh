#!/bin/bash

venv-act() {
    if [[ $1 == "-h" || $1 == "--help" ]]; then
        cat << EOF
Activate the given Python virtual environment.
If no path was given, an environment named '.venv' will be
activated instead, if it exists.

Usage:
  venv_act [path_to_venv]
  venv_act -h | --help

Arguments:
  path_to_venv    Optional. Path to your Python virtual environment.
                      If not given, this will find a virtual environment
                      named '.venv' in your current directory and activate it.

Options:
    -h,  --help    Show this help message.
EOF
        return 0
    fi

    # $# is the number of arguments passed
    if [[ $# -gt 1 ]]; then
        echo "Error: Expected 1 arguments, but received $#!"
        echo "Usage: venv_act [path_to_venv]"
        return 1
    # check whether an option is being given (- and --)
    elif [[ $1 == -* ]]; then
        echo "Error: Unknown option '$1'"
        echo "Try 'venv_act -h' for more information."
        return 1
    fi

    local venv_path="${1:-.venv}"

    # -d -f checks if directory/file exists
    if [[ ! -d "$venv_path" ]]; then
        # -z checks if string is empty
        if [[ -z "$1" ]]; then
            echo "Error: Cannot find venv in the current directory!"
            echo "Please either specify a path to your venv or create" \
                 "a venv named '.venv'"
        else
            echo "Error: Cannot find venv at '$venv_path'!"
        fi
        return 1
    elif [[ ! -f "$venv_path/Scripts/activate" ]]; then
        echo "Error: '$venv_path' is not a Python virtual environment!"
        echo "Please make sure your path is correct"
        return 1
    fi

    . "$venv_path/Scripts/activate"
}
