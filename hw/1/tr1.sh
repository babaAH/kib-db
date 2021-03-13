#! /bin/bash

DB=~/davecoffeeshop.db

echo Welcome to the Dave Coffeeshop!

if test -f "$DB"; then
    echo "$DB exists."
else
    echo "$DB missing => creating new file"
    touch $DB
fi

function getInstructions {

    echo "To log order, enter LOG"
    echo "To end session, enter EOS"
    echo  To end business day, enter EOD

}

getInstructions

while [ "$commandName" ne "EOD" ]
do
    read commandName

    echo $commandName
done
