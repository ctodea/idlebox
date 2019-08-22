#!/bin/bash
a=$1; b=$2; [[ "$a" -eq "0" || "$b" -eq "0" ]] && echo $a$b | tr -d 0 && exit 0
while [ $a -ne $b ]; do [[ "$a" -gt "$b" ]] && a=$(($a-$b)) || b=$(($b-$a)); done
echo $a


