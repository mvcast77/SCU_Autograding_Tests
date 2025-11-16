TARGET=kfile.c

sed -n '/MAX_LENGTH/p' $TARGET

sed -n '/MAX_LENGTH/{/#define/!p}' $TARGET
