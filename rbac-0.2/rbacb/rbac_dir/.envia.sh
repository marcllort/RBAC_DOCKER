#!/bin/bash

function llegeixDirConfig()
{
    if [ ! -f "/configuracio" ]        #si no esta configuracio, entorn no existeix i cal crearlo
    then
        echo "Fitxer de configuració base inexistent"
    fi

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
            4)
                DIRENTORN="$line"
                ;;
            5)
                FACILITY="$line"
                ;;

            *)
                ;;
        esac
        i=$((i+1))
    done < "/configuracio"
}


function llegeixConfig()
{
  if [ -f "/$rol" ]       #si no esta configuracio, entorn no existeix i cal crearlo
    then

        i=0
        while read -r line; do
            case "$i" in
                0)
                    IFS=',' read -r -a arrayProgrames <<< "$line"
                    ;;
                1)
                    direccioBashrc="$line"
                    ;;
                2)
                    tempsEntorn="$line"
                    ;;
                3)
                    tempsHome="$line"
                    ;;
                4)
                    publishPorts="$line"
                    ;;
                5)
                    exposedPorts="$line"
                    ;;
                6)
                    bridged="$line"
                    ;;
                7)
                    cpu="$line"
                    ;;
                8)
                    cpuShares="$line"
                    ;;
                9)
                    memFisica="$line"
                    ;;
                10)
                    memSwap="$line"
                    ;;

                *)
                    ;;
            esac
            i=$((i+1))

        done < "/$rol"
    else

        
        echo "Error, no existeix el fitxer configuracio del rol: $conf"
        exit
    fi
}


CONFIG=/data/users/config

CONFIGBASE=/data/users 


llegeixDirConfig
llegeixConfig

netcat 127.0.0.1 $publishPorts -w0<<END
$(whoami)-$1
END
