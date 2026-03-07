#!/usr/bin/env bash

# Indexed Arrays

#declare -a "${array[@]}"
#array=(one two three)

#echo "${array[0]}"
#echo "${array[1]}"
#echo "${array[2]}"


# Copy An Array To Another Array

#first_array=(
#	one
#	two
#	three
#)

# Use Parenthesis And Quotes To Copy An Array Into Another

#second_array=("${first_array[@]}")

# Loop Over New/Second Array

#for i in "${second_array[@]}"; do
#	echo "This is item $i"
#done

# Stringify Arrays

#this_array=(
#	one
#	two
#	three
#)
#echo "array is: ${this_array[*]}"

# Stringified Output: "array is: one two three"

# Associative Arrays

#declare -A array
#array[one]=1
#array[two]=2
#array[three]=3

#echo "${array[one]}"
#echo "${array[two]}"
#echo "${array[three]}"
#echo "${array[fake]}"

#for key in "${!array[@]}"; do
#	value=${array[$key]}
#	echo "got $key=$value"
#done
