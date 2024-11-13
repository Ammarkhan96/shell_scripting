#!/bin/bash

# Read the number of rows and columns
read -p "Enter the number of rows: " rows
read -p "Enter the number of columns: " columns

# Declare an empty array to hold the matrix
matrix=()

# Read matrix elements from the user
for ((i = 0; i < rows; i++)); do
    for ((j = 0; j < columns; j++)); do
        read -p "Enter element [$i][$j]: " value
        matrix[$((i * columns + j))]=$value
    done
done

# Display the matrix
echo "This matrix is:"
for ((i = 0; i < rows; i++)); do
    for ((j = 0; j < columns; j++)); do
        # Access the element at row i and column j
        echo -n "${matrix[$((i * columns + j))]} "
    done
    echo
done

