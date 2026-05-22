#!/bin/bash

# Data Types in Bash

echo "================= DATA TYPES IN BASH ================="
echo ""

# String Data Type
echo "--- String Data Type ---"
name="John Doe"
message="Hello, World!"
empty_string=""

echo "Name: $name"
echo "Message: $message"
echo "Empty string: '$empty_string'"
echo ""

# Integer Data Type
echo "--- Integer Data Type ---"
age=25
count=100
negative=-50

echo "Age: $age"
echo "Count: $count"
echo "Negative: $negative"
echo ""

# Floating Point (Decimal) Data Type
echo "--- Floating Point Data Type ---"
price=19.99
temperature=98.6
pi=3.14159

echo "Price: $price"
echo "Temperature: $temperature"
echo "Pi: $pi"
echo ""

# Arithmetic Operations
echo "--- Arithmetic Operations ---"
num1=10
num2=5

sum=$((num1 + num2))
diff=$((num1 - num2))
product=$((num1 * num2))
quotient=$((num1 / num2))
remainder=$((num1 % num2))

echo "Sum: $sum"
echo "Difference: $diff"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"
echo ""

# Arrays
echo "--- Array Data Type ---"
fruits=("Apple" "Banana" "Orange" "Mango")
numbers=(1 2 3 4 5)

echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"
echo "Array length: ${#fruits[@]}"
echo "Numbers: ${numbers[@]}"
echo ""

# Boolean (0 = true, 1 = false in exit codes)
echo "--- Boolean Data Type ---"
is_valid=1
is_empty=0

if [ $is_valid -eq 1 ]; then
    echo "Valid is true"
fi

if [ $is_empty -eq 0 ]; then
    echo "Empty is false"
fi
echo ""

# Type Checking Examples
echo "--- Type Checking ---"
value=42

# Check if numeric
if [[ $value =~ ^[0-9]+$ ]]; then
    echo "$value is a number"
fi

# Check if string
text="Hello"
if [[ $text =~ ^[a-zA-Z]+$ ]]; then
    echo "$text is a string"
fi
