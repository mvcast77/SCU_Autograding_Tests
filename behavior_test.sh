#!/bin/bash

echo "This test only verifies the behavior of the example file"

make clean btest

output=$(./btest << EOF
2
0
EOF
) 

make clean

match=$(echo "$output" | grep -Po '(case 2)')

if [ -n "$match" ]; then
	echo "✅ Output contained word(s): '$match'"
	exit 0
else 
	echo "❌ Output is clear, basic insert failed"
	exit 1
fi
