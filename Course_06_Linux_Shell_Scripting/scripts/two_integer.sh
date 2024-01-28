#!/bin/bash

echo 'Hello, Please enter two intergers: '
read integer_one

echo 'Please enter the second interger: '
read integer_two 

sum=$(($integer_one + $integer_two))
product=$(($integer_one * $integer_two))

echo "sum of $integer_one and $integer_two is :  " $(($integer_one + $integer_two)) 
echo "this is the product of the two entered intergers: $(($integer_one * $integer_two))"

if [[ $sum > $product ]] 
then
echo "$sum is greater than $product"
elif [[ $sum < $product ]]
then
echo "$sum is less than product!"
else
echo "$sum and $product are equal"
fi

#!/bin/bash

echo -n "Enter an integer: "
read n1
echo -n "Enter another integer: "
read n2

sum=$(($n1+$n2))
product=$(($n1*$n2))

echo "The sum of $n1 and $n2 is $sum"
echo "The product of $n1 and $n2 is $product."

if [ $sum -lt $product ]
then
   echo "The sum is less than the product."
elif [[ $sum == $product ]]
then
   echo "The sum is equal to the product."
elif [ $sum -gt $product ]
then
   echo "The sum is greater than the product."
fi