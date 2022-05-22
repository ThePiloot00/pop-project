#!/bin/bash

if [ "$REQUEST_METHOD" = "GET" ]; then
   
    # Note that the environment variables $REQUEST_METHOD and $QUERY_STRING can be processed by the shell directly. 
    # One must filter the input to avoid cross site scripting.
    
    Var1=$(echo "$QUERY_STRING" | sed -n 's/^.*var1=\([^&]*\).*$/\1/p')    # read value of "var1"
    Var1_Dec=$(echo -e $(echo "$Var1" | sed 's/+/ /g;s/%\(..\)/\\x\1/g;'))    # html decode
    

    addJail.sh $Var1