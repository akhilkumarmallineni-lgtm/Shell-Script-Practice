#!/bin/bash

# Display branch creation information
branch_name=$1

echo "New branch created: $branch_name"
echo "Branch created at: $(date)"
echo "Current branch: $(git rev-parse --abbrev-ref HEAD)"
echo "Total commits in this branch: $(git rev-list --count HEAD)"
