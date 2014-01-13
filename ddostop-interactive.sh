#!/bin/bash

portnumber=80
while true; do
        read -p "Which port would you like me to search (default 80):" pn
        case $pn in
                *[!0-9]*  ) echo "Please enter a port number";;
                ""        ) break;;
                *         ) portnumber=$pn; break;;
        esac
done

screenupdate=1
while true; do
        read -p "Screen update interval (default 1):" si
        case $pn in
                *[!0-9]*  ) echo "Please enter a number";;
                ""        ) break;;
                *         ) screenupdate=$si; break;;
        esac
done

reversedns_enabled=0
while true; do
        read -p "Would you like to enable reverse dns? (y/n, default no)" yn
        case $yn in
                [Yy]* ) reversedns_enabled=1; break;;
                [Nn]* ) reversedns_enabled=0; break;;
                ""    ) break;;
                *     ) echo "Please answer yes(y) or no(n).";;
        esac
done


watch  -t -n${screenupdate} ./ddostop.sh ${portnumber} ${reversedns_enabled}
