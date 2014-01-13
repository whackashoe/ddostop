ddostop
=======

ddostop lets you see which ip addresses are connecting to any specific port

if you think that you may be under a ddos attack, or just want to see which ip addresses are currently accessing your server the most ddostop has you covered.

requirements
============

* standard unix utilities
* netstat
* host
* column
* watch (for realtime / interactive mode)

example output
==============

    92  88.221.142.150  
    88  93.96.184.175  
    63  98.117.94.59   
    22  129.29.198.238   
    13  127.83.154.119   
    12  66.117.234.128  
    5   89.8.134.93     


usage
=====

`ddostop-interactive` for people who want an interactive question based approach with updating screen

`ddostop-base [port(default 80] [reverse dns(default no)]` for people who just want a quick look or for logging purposes



installation
============

    git clone https://github.com/whackashoe/ddostop.git
    cd ddostop
    ./install.sh #OR use as is
