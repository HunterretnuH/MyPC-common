#!/bin/bash
# vi: foldmethod=marker foldmarker=#{,#} nowrap

# $1 - pass $BASH_SOURCE. Required to print correct file name in error message.
SOURCE=$1
trap error ERR

#{ FUNCTIONS

    function error() { #{
        RESULT=$?
        echo -e "\n[FILE: \"${SOURCE}\" LINE: \"${BASH_LINENO[0]}\"] \033[31;1mFail! Error code: $RESULT\033[0m"
        press_to_continue
    } #}

    function press_to_continue() { #{
        read -n 1 -p "\nPress enter to continue... (Esc to cancel)" CONFIRM && if [[ "$CONFIRM" == "" ]]; then exit 1; fi
    } #}

    function section() { #{
        # $1 - message
        if [ $? -ne 0 ];then error; fi

        MSG=$1
        if [ -n "$IS_IT_FIRST_MESSAGE" ]; then 
            echo -e "${PREFIX}\033[32;1mSuccess!\033[0m";
        fi
        IS_IT_FIRST_MESSAGE=FALSE
        echo -e "${PREFIX}$MSG"
    } #}

#} FUNCTIONS



