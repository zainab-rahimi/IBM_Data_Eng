
#!/bin/bash

# ## Ask the user for a yes/no question

# echo -e "Hey are you fine today? \nAnswer with 'yes' or 'no' "

# read user_answer

# if [ $user_answer = 'yes' ]; then
#     echo "We are happy you are doing good!"
# elif [ $user_answer = 'no' ]; then
#     echo "Oh we are sorry, how we can help you to feel better?"
# else
#     echo "You should answer either with 'yes' or 'no'"
# fi 


# ### Exercise 1 - perform mathematical computations
# # Ask user to enter two integer number and return the sum and product of the two numbers


# echo  "Now enter two integers one after another:  " 
# read int_one

# echo "Please enter the second interger"
# read int_two

# sum=$(($int_one + $int_two))
# product=$(($int_one * $int_two))

# echo -e "The sum of two intergers is $sum \nand the product of the integers is $product"

# ### Exercise 2 - Add logic to your computaion 
# #Add logic to your script that determines whether the sum is greater than, less than, or equal to the product.
# #Display an appropriate statement corresponding to each possible result.

# if [[ $sum -gt $product ]] ; then 
#     echo "The sum is greater than product"
# elif [[ $sum == $product ]] ; then 
#     echo "Sum and product have the same value"
# else
#     echo "Apparantly sum is less than the product"
# fi

### Exercise 3 - Using arrays for storing and accessing data within for loops
#3.3. Create a Bash script that parses table(csv_file) columns into 3 arrays

data="./arrays_table.csv"

column_1=($(cut -d "," -f1 $data))
column_2=($(cut -d "," -f2 $data))
column_3=($(cut -d "," -f3 $data))

## To check that arrays has been created properly and we can access the elements insude the array
# for i in "${column_1[@]}" ; do
# echo "$i"
# done

## 3.4. Create a new array as the difference of the third and second columns.
differnce_column=("difference_column") # initialize array with header

for ((i=1 ; i <  "${#column_3[@]}" ; i++)) ## Starting the i from one to skip the first element in the array that is a string (column_name)
    do 
        differnce_column[$i]=$((column_3[$i] - column_2[$i]))
    done
echo "${differnce_column[@]}" > report1.csv


paste -d "," "./arrays_table.csv" report1.csv > report.csv




