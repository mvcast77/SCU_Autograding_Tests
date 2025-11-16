TARGET=kfile.c

echo "Lines with pattern"
sed -n '/MAX_LENGTH/p' $TARGET

echo "Lines with first pattern, without second pattern"
sed -n '/MAX_LENGTH/{/#define/!p}' $TARGET

echo "Trying to grab the name of the macro"
sed -nr '/#define[\s\t]+\(.\)$/\1/p' $TARGET
