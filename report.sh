#!/bin/bash
#
# Print a report of admitted students.
#
# Copyright (c) 2019, Matthew Chalifoux.   
#

. admissions.sh

outputFile=$(mktemp)

admissions $1 > outputFile 

a=$(mktemp)
b=$(mktemp) 
sort outputFile > a


# chop=1
# IFS=$'\n' 

# here=$1
# echo "***************************************LALALALAL"
# for i in $(cat a); do    
#     grep "$i" data >> b
# done
# echo "***********************************************BOBOBOBO"
# for (( i=1; i <= 10; i++ ))
# do
# echo "The next number is $i"
# done

# awk '
#     {
#         # print $1
#         numbers[chop]=$1
#         # print numbers[1]
#         ++chop

        

        
#     }

# ' outputFile  

count=0


while read line
do
    # echo $line
    # catch[$count]=$line
    # count=$[$count + 1]
    grep "$line" data >> b
done < a



# for b in "${catch[@]}"; do
#     # echo "$b"
#     grep "$b" data >> a
    
# done







cat /dev/null > a




awk '
    {
        if($3 == "T"){
            $3="Yes"
        } else if($3 == "F"){
            $3="No"
        }

        if($5 == "T"){
            $5="Yes"
        } else if($5 == "F"){
            $5="No"
        }

        if($8 == "T"){
            $8="Yes"
        } else if($8 == "F"){
            $8="No"
        }

        

        printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n", $1, $2, $7, $3, $5, $8, $6)       
    }

' b  

cat /dev/null > b

cat /dev/null > outputFile

rm -f $a
rm -f $b
rm -f $outputFile

rm a
rm b
rm outputFile


  
