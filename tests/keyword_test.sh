TARGET=kfile.c

echo "Lines with pattern"
sed -n '/MAX_LENGTH/p' $TARGET

echo "Lines with first pattern, without second pattern"
sed -n '/MAX_LENGTH/{/#define/!p}' $TARGET
