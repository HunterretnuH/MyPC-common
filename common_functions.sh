#!/bin/bash
# vi: foldmethod=marker foldmarker=#{,#} nowrap

# $1 - pass $BASH_SOURCE. Required to print correct file name in error message.
SOURCE=$1
trap error ERR

#{ FUNCTIONS

    function error() { #{
        RESULT=$?
        echo -e "[FILE: \"${SOURCE}\" LINE: \"${BASH_LINENO[0]}\"] \033[31;1mFail! Error code: $RESULT\033[0m"
        exit 1
    } #}

    function press_to_continue() { #{
        read -n 1 -p "\nPress enter to continue... (Esc to cancel)" CONFIRM && if [[ "$CONFIRM" == "" ]]; then exit 1; fi
    } #}

    function section() { #{
    # $1 - message
        MSG=$1
        if [ -n "$IS_IT_FIRST_MESSAGE" ]; then echo -e "\033[32;1mSuccess!\033[0m"; fi
        IS_IT_FIRST_MESSAGE=FALSE
        echo -e "$MSG"
    } #}

#} FUNCTIONS



