#!/bin/bash

# Special Variables in Bash - Comprehensive Guide

echo "================= SPECIAL VARIABLES ================="
echo ""

# Positional Parameters
echo "--- Positional Parameters ---"
echo "\$0 (Script name): $0"
echo "\$1 (First argument): $1"
echo "\$2 (Second argument): $2"
echo "\$# (Total arguments): $#"
echo "\$@ (All arguments): $@"
echo "\$* (All as string): $*"
echo ""

# Exit and Process Information
echo "--- Exit and Process Information ---"
echo "\$? (Last exit status): $?"
echo "\$$ (Current process ID): $$"
echo "\$! (Last background process ID): $!"
echo ""

# Environment Variables
echo "--- Environment Variables ---"
echo "\$HOME (Home directory): $HOME"
echo "\$PWD (Current directory): $PWD"
echo "\$USER (Current user): $USER"
echo "\$SHELL (Shell path): $SHELL"
echo ""

# Script Information
echo "--- Script Information ---"
echo "\$LINENO (Current line number): $LINENO"
echo "\$SECONDS (Seconds elapsed): $SECONDS"
echo "\$RANDOM (Random number): $RANDOM"
echo "\$- (Shell options): $-"
echo ""

# Additional Special Variables
echo "--- Additional Variables ---"
echo "\$OLDPWD (Previous directory): $OLDPWD"
echo "\$PATH (Search path): $PATH"
