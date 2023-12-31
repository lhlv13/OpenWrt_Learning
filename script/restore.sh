#!/bin/ash
# Program:
#       This script can restore your /etc/config
# History:
#       2023/10/11 Yuyi First Release

files=$(ls /tmp/spare)

for f in ${files}
do
        test -x ${f} && pred=1 || pred=0
        if [ "${pred}" -eq 0 ]; then
                ##
                config=$(echo "${f}" | cut -d '.' -f 1)
                uci import ${config} < ${f}
        fi
done

echo "/etc/config reset success!"
echo "Please command >>  uci commit"