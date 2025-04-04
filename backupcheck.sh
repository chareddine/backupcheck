#!/bin/bash

# Prompt for username
read -p "Enter the customer username: " customerusername

# First run
echo "Running disk usage for /home/$customerusername (1st time)..."
first=$(du -s "/home/$customerusername" | cut -f1)
echo "Disk usage at first check: $first KB"

# Wait 3 minutes (180 seconds)
echo "Waiting for 3 minutes..."
sleep 18

# Second run
echo "Running disk usage for /home/$customerusername (2nd time)..."
second=$(du -s "/home/$customerusername" | cut -f1)
echo "Disk usage at second check: $second KB"

# Compare the two values
if [ "$first" -ne "$second" ]; then
    echo "✅ Backups are being restored - Not stuck!"
else
    echo "⚠️  Backups are stuck or not running!"
fi

echo "Done."
