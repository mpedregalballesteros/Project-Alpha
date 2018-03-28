#!/bin/bash
function show_time () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

hosts=()
cont=0
printf "███╗   ███╗███╗   ██╗███████╗     ██████╗███████╗███╗   ███╗███████╗██╗  ██╗\n"
printf "████╗ ████║████╗  ██║██╔════╝    ██╔════╝██╔════╝████╗ ████║██╔════╝╚██╗██╔╝\n"
printf "██╔████╔██║██╔██╗ ██║███████╗    ██║     █████╗  ██╔████╔██║█████╗   ╚███╔╝ \n"
printf "██║╚██╔╝██║██║╚██╗██║╚════██║    ██║     ██╔══╝  ██║╚██╔╝██║██╔══╝   ██╔██╗ \n"
printf "██║ ╚═╝ ██║██║ ╚████║███████║    ╚██████╗███████╗██║ ╚═╝ ██║███████╗██╔╝ ██╗\n"
printf "╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝     ╚═════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝\n"
printf "\tIntroduce el nombre de las Sedes a Analizar, y pusla Enter:\n"

while read site
do
        if [[ $site != "" ]];
        then
                hosts[cont++]=$site
        else
                break
        fi
done


for siteid in "${hosts[@]}"
do
         printf "[$siteid]\n"

                uptime="$(snmpwalk -Os -c ConsolTFjd -v 2c $siteid .1.3.6.1.6.3.10.2.1.3 2>/dev/null | cut -d ":" -f2)"
                        if [[ $uptime = "" ]];
                        then
                                printf "\tRouter Offline\n"
                        else
                                printf "\tEl router esta arriba desde: "
                                printf "\t%s" $(show_time $uptime)
                                printf "\n"
                        fi


                uptimebgp="$(snmpwalk -Os -c ConsolTFjd -v 2c $siteid  1.3.6.1.2.1.15.3.1.16 2>/dev/null | cut -d ":" -f2)"
                        if [[ $uptimebgp != "" ]];
                        then
                                printf "\tLa BGP esta arriba desde : "
                                printf "\t%s" $(show_time $uptimebgp)
                                printf "\n"
                        fi
done

