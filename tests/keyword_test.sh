TARGET=kfile.c

echo "Lines with pattern"
sed -n '/MAX_LENGTH/p' $TARGET

echo "Lines with first pattern, without second pattern"
sed -n '/MAX_LENGTH/{/#define/!p}' $TARGET

echo "Trying to grab the name of the macro"
output=$(sed -nE 's/^#define[ \s\t]+([^ \s\t]+).*$/\1/p' $TARGET)

echo "Using the macro name to check for future usage"
sed -nE "/^.*($output).*$/{/#define/!p}" $TARGET
