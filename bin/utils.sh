#!/usr/bin/env bash

# Enhanced function to prompt the user to confirm an action
confirm_action() {
	local prompt_message="$1"
	local user_response

	echo "$prompt_message"
	read -p "Do you want to continue? (y/n): " user_response

	if [[ ! $user_response =~ ^[Yy]$ ]]; then
		echo "Action aborted by the user."
		exit 1 # Exit script if the user does not confirm
	fi
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
