#!/bin/bash
IP=127.0.0.1 #change me
for y in $(for i in $(ansible all -m shell -a "ntpq -p" | awk '{print $(NF-1)}' | grep -E '^\-?[0-9]*\.[0-9]*$' | sed 's/\-//g' | sort -nr | awk '$1>10.0'); do ansible all -m shell -a "ntpq -p" | grep -B3 "$i"; done | grep srv | awk '{print $1}' | uniq); do
  ansible "${y}" -m shell -a "systemctl stop ntpd"
  ansible "${y}" -m shell -a "ntpdate $IP"
  ansible "${y}" -m shell -a "systemctl start ntpd"
done
