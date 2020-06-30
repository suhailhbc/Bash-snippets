#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }

PROVIDERS="
1.1.1.1#Cloudflare 
8.8.8.8#Google 
208.67.222.222#Opendns 
9.9.9.9#Quad9 
4.2.2.1#Level3 
80.80.80.80#Freenom 
199.85.126.20#Norton 
185.228.168.168#Cleanbrowsing 
77.88.8.7#Yandex 
176.103.130.132#Adguard 
156.154.70.3#Neustar 
8.26.56.26#Comodo
"

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="google.com whatsapp.com github.com amazon.in live.com youtube.com"


totaldomains=0
printf "%-18s" ""
for d in $DOMAINS2TEST; do
    totaldomains=$((totaldomains + 1))
    printf "%-8s" "test$totaldomains"
done
printf "%-8s" "Average"
echo ""


for p in $PROVIDERS; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-18s" "$pname"
    for d in $DOMAINS2TEST; do
        ttime=`$dig +tries=1 +time=2 +stats @$pip $d |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        printf "%-8s" "$ttime ms"
        ftime=$((ftime + ttime))
    done
    avg=`bc -lq <<< "scale=2; $ftime/$totaldomains"`

    echo "  $avg"
done


exit 0;
