#!/bin/bash

if [[ $* == *--help* ]]; then
    echo "ddostop version 1.0"
    echo "==================="
    echo "NOTES:"
    echo "    consider using ddostop-interactive if you find yourself reading this too much"
    echo "    reverse dns is slow with many concurrent connections, use only if necessary"
    echo ""
    echo "SYNOPSIS:"
    echo "    ddostop is a top like viewer designed to investigate ddos attacks (or friendly traffic)"
    echo ""
    echo "USAGE:"
    echo "    ddostop [port(default 80)] [enable reverse dns(default 0)]"
    echo ""
    echo "EXAMPLES:"
    echo "    ddostop 22 #listen on port 22"
    echo "    ddostop 6789 1 #listen on port 6789 and list reverse dns"
    echo ""
    echo "please report bugs or modifications to https://github.com/whackashoe/ddostop"
fi

portnumber=80
reversedns_enabled=0

[ "${1}" ] && portnumber=${1}
[ "${2}" ] && reversedns_enabled=${2}

netstat -nta |
awk 'match($4,/:'${portnumber}'$/) && $6=="ESTABLISHED" {sub(/:[0-9]+/,"",$5); print $5}' |
uniq -c |
sort -nr |
while read line; do 
        if [[ ${reversedns_enabled} -eq 1 ]]; then
                read -r _ justipaddress _ <<< "$line"
                reversednsstring=$( host ${justipaddress} )
                if [[ "$reverseDnsString" == *'domain name pointer'* ]]; then
                        echo "${line} $( ${reversednsstring} | grep -o "pointer .*" | cut -d' ' -f2 )"
                else
                        echo "${line} reverse-dns-not-found"
                fi
                
        else
                echo "${line}"
        fi
done |
column -t
