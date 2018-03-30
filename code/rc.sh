#!/bin/bash
# Remove comments from a file
#[[ "$#" -gt 1 ]] && echo "" exit 1

file = $1
is_ascii(){
	file "$1" | grep -iq ascii 
}
