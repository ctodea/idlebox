#!/bin/bash
#output the distribution of pods among the nodes using kubectl
bc --version &> /dev/null || $(echo "ERROR: bc not present, install it" && exit 1)
declare -A hashTable
pods=$(kubectl get pods -o wide | sed '1d' | awk '{print $NF}' | sort | tr '\n' ' ')
n_pods=$(sed '/^$/d' <<< "${pods}" | wc -w)
for i in ${pods}; do
  hashTable["${i}"]=$(( ${hashTable["${i}"]} + 1 ))
done
for i in "${!hashTable[@]}"; do
  ratio=$(bc <<< "scale=2; ${hashTable[$i]}/${n_pods}")
  echo "${i} | ${ratio//./}%"
  echo "TOTAL | ${n_pods}"
done
