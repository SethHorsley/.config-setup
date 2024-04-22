#!/usr/bin/env bash

# Enhanced function to prompt the user to confirm an action
confirm_action() {
	local prompt_message="$1"
	local user_response

	echo "$prompt_message"
	read -p "Do you want to continue? (y/n/q): " user_response

	case "$user_response" in
	[Yy])
		# If user says 'Yes', just return and continue the script execution
		return
		;;
	[Nn])
		# If user says 'No', skip this action and continue with the next
		echo "Action skipped by the user."
		return 1
		;;
	[Qq])
		# If user says 'Quit', exit the script entirely
		echo "Exiting script as requested by the user."
		exit 1
		;;
	*)
		# Handle unexpected input
		echo "Invalid response. Exiting now."
		exit 1
		;;
	esac
}

# Function to check if a string is in a file, and append it if not present
check_if_installed_or_install() {
	local string_to_add="$1"
	local target_file="$2"

	# Expand tilde to the home directory in the target file path
	target_file="${target_file/#\~/$HOME}"

	# Use tempfile to handle multi-line complexities
	local temp_file=$(mktemp)
	echo "$string_to_add" >"$temp_file"

	# Check if the content of temp_file is already in the target file
	if ! grep -Fxqf "$temp_file" "$target_file"; then
		echo "Appending to $target_file..."
		echo "$string_to_add" >>"$target_file"
	else
		echo "Entry already present in $target_file."
	fi

	# Clean up temporary file
	rm "$temp_file"
}
