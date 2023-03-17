#!/bin/bash
# A script to change the filename suffix of all files in a directory with
# a given suffix to have a different suffix.
# Download the script to a place where it can be run and ensure it is executable.
# Change to the directory containing files to rename.
# Run the script passing in two arguments:
#  path_to_directory/rename.sh suffix_to_change suffix_wanted.
# @author Andy Turner (a.g.d.turner@leeds.ac.uk)
# @Licence https://www.apache.org/licenses/LICENSE-2.0

#echo "The number of arguments is: $#"

if [ $# -ne 2 ]; then
  echo "Please specify 2 arguments"
  echo "Usage: path_to_directory/rename.sh suffix_to_change suffix_wanted"
  exit
else
  echo "Changing filenames from suffix $1 to suffix $2 as reported:"
  echo "<Renaming>"
fi

suffix_to_change=$1
suffix_wanted=$2

#suffix_to_change="csv"
#suffix_wanted="txt"

suffix_to_change_size=${#suffix_to_change}

for file in *
do
  if [[ $file == *$suffix_to_change ]]; then
    size=${#file}
    start_index=$(( $size - $suffix_to_change_size))
    #echo $file $size $start_index
    #echo ${file:0:$start_index}
    #echo mv $file ${file:0:$start_index}$suffix_wanted
    mv $file ${file:0:$start_index}$suffix_wanted
    echo "Renamed $file to ${file:0:$start_index}$suffix_wanted"
  fi
done

echo "</Renaming>"