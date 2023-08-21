#!/bin/bash


# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to terraform/module/network directory
DIRECTORIES=("$SCRIPT_DIR/terraform/network" "$SCRIPT_DIR/terraform/server" "$SCRIPT_DIR/terraform/database")

# Define a function to run Terraform commands
run_terraform_commands() {
  local dir="$1"
  
  # Check if the directory exists
  if [ ! -d "$dir" ]; then
    echo "Error: Directory not found: $dir"
    exit 1
  fi
  
  # Change to the directory
  cd "$dir" || exit 1

  #Run your Terraform commands here
  terraform init
  terraform apply --auto-approve
  
  # Change back to the original directory
  cd - || exit 1
}

for dir in "${DIRECTORIES[@]}"; do
  run_terraform_commands "$dir"
done