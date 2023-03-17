#!/bin/bash
# A script to count the number of values in the files in a directory.
# Download the script to a place where it can be run and ensure it is executable.
# Change to the directory containing files to count.
# Run the script passing in an argument:
#  path_to_directory/rename.sh number_of_values
# Script developed by Andy Turner (a.g.d.turner@leeds.ac.uk)
# Licence: https://www.apache.org/licenses/LICENSE-2.0

#echo "The number of arguments is: $#"

if [ $# -ne 1 ]; then
  echo "Please specify the number_of_values"
  echo "Usage: path_to_directory/count.sh number_of_values"
  exit
else
  echo "Checking files contain $1 values. Files that do not contain $1 values are reported:"
  echo "<Report>"
fi

number_of_values=$1

#number_of_values=100

for file in *
do
  #echo $file
  var=$(wc $file | awk '{print $2}')
  #echo $var
  if [[ $var != $1 ]]; then
     echo "Warning $file contains only $var values"
  fi
done

echo "</Report>"