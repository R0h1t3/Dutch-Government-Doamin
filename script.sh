#!/bin/bash
NC="\e[0m"
COL="\e[31m"
echo -e "$COL Automated Script to Download all the Dutch Government Domains"
echo "[SCRIPT] System Updating..."
sudo apt update 2> /dev/null &> /dev/null
echo "[SCRIPT] System Updated"
shred -u -f file.ods dutchsub.txt file.csv 2> /dev/null &> /dev/null
echo "[SCRIPT] Old Files Shreded"
url=$(echo -e "https://www.communicatierijk.nl$(curl -ks https://www.communicatierijk.nl/vakkennis/r/rijkswebsites/verplichte-richtlijnen/websiteregister-rijksoverheid | grep ".ods" | sed -n 's/.*href="\([^"]*\).*/\1/p')")
wget -O file.ods $url &> /dev/null
echo "[SCRIPT] Original Databse Downloaded"
libreoffice --convert-to csv file.ods --headless 2> /dev/null &> /dev/null
echo "[SCRIPT] Downloaded Database Converted to csv format"
cat file.csv | tr ',' ' ' | awk '{print $1}' | sed 's/http:\/\/\|https:\/\///g' | sed -e '1,3d' | sed 's/\.com.*/.com/' | sed 's/\.nl.*/.nl/' | sed 's/\.org.*/.org/' | sed 's/\.eu.*/.eu/' | awk -F\. '{print $(NF-1) FS $NF}' | sed -E '/www\.org|www\.nl|www\.com|www\.eu|org\.org|eu\.eu|nl\.nl|eu\.eu/d' | sort -u | uniq -u | anew -q dutchsub.txt
echo -e "[SCRIPT] Domains are extracted from the databse and saved into $COL dutchsub.txt"
echo -e "[SCRIPT] Total subdomains found:$COL $(cat dutchsub.txt | wc -l) $NC\n"
sleep 2s
echo -e "[SCRIPT] Here are the domains:\n"
cat dutchsub.txt

