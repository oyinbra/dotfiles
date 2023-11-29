# Initialize an empty array to store execution times
execution_times=()

# Run the command five times and capture the execution time for each iteration
for i in {1..5}; do
    # Capture the execution time using the `time` command
    time zsh -i -c exit
    # Extract the execution time from the output of the `time` command
    execution_time=$(time zsh -i -c exit | grep real | awk '{print $2}')
    # Add the execution time to the array
    execution_times+=($execution_time)
done

# Calculate the sum of execution times
sum_execution_times=0
for execution_time in "${execution_times[@]}"; do
    sum_execution_times=$((sum_execution_times + execution_time))
done

# Calculate the average execution time
average_execution_time=$(bc <<< "scale=2; $sum_execution_times / 5")

echo "Average execution time: $average_execution_time"

