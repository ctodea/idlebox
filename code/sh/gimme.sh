#!/bin/bash
ssh_directory="/root/.ssh/config.d/"
files=$(ls -1r "${ssh_directory}")
n_files=$(wc -l <<< "${files}")
for i in $(seq "$n_files");
  do echo $i $(sed -n "${i}"p <<< "${files}");
done
read -p 'Pick one: ' user_sel
echo "-------------------------------"
for i in "$(grep '^Host' ${ssh_directory}$(sed -n ${user_sel}p <<< ${files}) | awk '{print $NF}' | sort)";
  do echo "$i"
done
echo "-------------------------------"
