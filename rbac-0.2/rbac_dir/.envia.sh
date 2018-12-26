#!/bin/bash

function llegeixDirConfig()
{
    i=0
    while read -r line; do
        case "$i" in
            0)
                CONFIG="$line"
                ;;

            1)
                PORTroot="$line"
                ;;
            
            2)
                
                PORTmail="$line"
                ;;
            3)
                MAIL="$line"
                ;;

            *)
                ;;
        esac
        i=$((i+1))
    done < "$CONFIGBASE/configuracio"
}


llegeixDirConfig

netcat 127.0.0.1 $PORTroot -w0<<END
$(whoami)-$1
END
