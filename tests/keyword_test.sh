TARGET=kfile.c

sed -n '/MAX_LENGTH/{#define/!p}' $TARGET
