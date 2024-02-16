#!/bin/bash

# Check if running with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Closes and removes old revisions of snaps
set -eu

# Check if an argument (e.g., "preview") is provided
if [[ "$1" == "preview" ]]; then
    PREVIEW=true
    echo "Preview mode: Only showing snaps to be closed and removed."
    shift # Remove the first argument ("preview") from the list
else
    echo "LIVE mode: This will remove old snaps! Executing..."
    PREVIEW=false
fi

# Check if an "ignore" parameter is provided
IGNORE_LIST=""
if [[ "${1:-}" == "ignore="* ]]; then
    IGNORE_LIST=$(echo "${1#ignore=}" | tr ',' ' ')
    echo "Ignoring the following snaps: $IGNORE_LIST"
    shift # Remove the "ignore" parameter from the list
fi

# Function to check if a snap is running and stop it
stop_snap_if_running() {
    local snapname=$1
    local revision=$2

    # Check if the snap is running
    if snap list "$snapname" | grep -q -E "\s+$revision\s+.*[A-Za-z]"; then
        echo "Stopping running instance of $snapname --revision=$revision"
        snap stop "$snapname"
    fi
}

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read -r snapname revision; do
        # Check if the snap is in the ignore list
        if [[ $IGNORE_LIST ]]; then
            ignore_snap=false

            # Loop through each entry in the ignore list
            for ignore_entry in $IGNORE_LIST; do
                # Check if $snapname starts with the current ignore entry
                if [[ $snapname == $ignore_entry* ]]; then
                    ignore_snap=true
                    break 
                fi
            done

            if $ignore_snap; then
                echo "Skipping snap: $snapname --revision=$revision (Ignored)"
                continue
            fi
        fi
        
        if $PREVIEW; then
            echo "Preview: Would remove $snapname --revision=$revision"
        else
            echo "Check if snap is running: $snapname --revision=$revision"
            stop_snap_if_running "$snapname" "$revision"

            echo "Removing snap: $snapname --revision=$revision"
            snap remove "$snapname" --revision="$revision"
        fi
    done
