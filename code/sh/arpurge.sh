#!/bin/bash
INVENTORY_FILE="/home/caocpusr/inv"
LOG_FILE="/home/caocpusr/log"
for i in $(cat "${INVENTORY_FILE}"); do
    INCOMPLETE= && INCOMPLETE=$(ssh -q $i '. /etc/profile; sudo arp -a | grep eth0 | grep incomplete' | grep -v '?' )
    [[ -n $INCOMPLETE ]] && echo $(date '+%Y-%m-%d %H:%M:%S') NODE $i has imcomplete entries: "$INCOMPLETE" >> $LOG_FILE && echo >> $LOG_FILE #some loging
    [[ -n $INCOMPLETE ]] && for y in $(echo "$INCOMPLETE" | awk '{print $1}'); do ssh -q $i ". /etc/profile; sudo arp -d $y" ; done
done
