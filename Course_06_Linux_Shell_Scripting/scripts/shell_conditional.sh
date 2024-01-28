
#! /bin/bash
echo -e "hey are you ok today? \nresponse with yes or no? "
read user_response

if [ "$user_response" == "yes" ]
then
        echo "We are happy you are ok"
elif [ "$user_response" == "no" ]
then
        echo "I am sorry to hear it, why so?"
else 
        echo "$user_response" "that is great! anyway :D"
fi
