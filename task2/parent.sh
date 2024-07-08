#!/bin/bash

while true; 
do
    # read -p "Enter 2 space separated integers: " numbers
    read -p "Enter 2 space separated integers: " input
    IFS=' ' read -r -a num_list <<< "$input"

    if [ ${#num_list[@]} -ne 2 ]; then
        echo "Enter exactly 2 integers, restarting main process."
    else
        num1=${num_list[0]}
        num2=${num_list[1]}

        ./child.sh "$num1" "$num2" &  #runnning a child in bg
        child_pid=$! #PID of the child process $! obtains PID of the most recent run bg process

        echo "Started child process with PID: $child_pid"

        wait $child_pid #needed for synchronization.
        exit_status=$?

        echo "Child process with PID $child_pid, exit status: $exit_status"
        if [ $exit_status -eq 0 ]; then
            break
        else
            echo "Restarting child process."
        fi
    fi
done