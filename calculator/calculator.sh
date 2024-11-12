#!/bin/bash

# Basic Calculator Script

 echo "Enter first number: "
 read num1

 echo "Enter second number: "
 read num2

 echo "Choose an Operation (+, -, *, /):"
 read op

 case $op in
    +)
            result=$(echo "$num1 + $num2" | bc)
            echo "Result: $result"
            ;;
    -)
            result=$(echo "$num1 - $num2" | bc)
            echo "Result: $result"
            ;;
    \*)
            result=$(echo "$num1 * $num2" | bc)
            echo "Result: $result"
            ;;
    /)
            if [ "$num2" -eq 0 ]; then
                    echo "Error: Division by zero is not allowed."
            else
                    result=$(echo "scale=2; $num1 / $num2" | bc)
                    echo "Result: $result"
            fi
            ;;
    *)
          echo "Invalid operation. Please use +, -, *, or /."
            ;;
 esac

