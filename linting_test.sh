#!/bin/bash

OLD=lfile.c
NEW=temp.c

cp $OLD $NEW

vim -s commands.keys $NEW

difference=$(diff $OLD $NEW)

if [ -n "$difference" ]; then
	echo "Difference detected"
	readable=$(diff -u $OLD $NEW)
	echo "$readable"
else
	echo "Perfect Indentation"
fi

rm $NEW
