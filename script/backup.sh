#!/bin/ash
# Program:
#       This script can copy /etc/config/* to workspace
# History:
#       2023/10/11 Yuyi First Release
tmp_path="/tmp/backup"

mkdir -p ${tmp_path}

files=$(ls /etc/config)

for f in ${files}
do
        uci export ${f} > ${tmp_path}/${f}.txt
        echo "${f}.txt finish!"
done
