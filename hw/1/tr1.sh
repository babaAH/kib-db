#! /bin/bash

DB=~/davecoffeeshop.db

echo Welcome to the Dave Coffeeshop!

coffees["AME"]=100
coffees["ESP"]=120
coffees["CAP"]=150
coffees["LAT"]=170
coffees["RAF"]=200

echo $coffees


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

function inputOrder {
    read -p "Barista name: " baristaname
    read -p "Drinking: " drinking
    drinkPrice=-1

    if [ "$drinking" = "AME" ]
    then
        drinkPrice=100
    fi

    if [ "$drinking" = "ESP" ]
    then
        drinkPrice=120
    fi

    if [ "$drinking" = "CAP" ]
    then
        drinkPrice=150
    fi

    if [ "$drinking" = "LAT" ]
    then
        drinkPrice=170
    fi

    if [ "$drinking" = "RAF" ]
    then
        drinkPrice=200
    fi

    if [ $drinkPrice != -1 ]
    then
        record="$baristaname;$drinking;$drinkPrice"
        echo "$record" >> $DB
    else
        echo "Invalid drink $drinking, ignoring"
    fi
}


function summarize {
    echo
}

getInstructions
read commandName

while [ "$commandName" != "EOS" ]
do

    if [ "$commandName" = "LOG" ]
    then
        inputOrder
    fi

    if [ "$commandName" = "EOD" ]
    then
        summarize
    fi
    read commandName

    echo $commandName
done
