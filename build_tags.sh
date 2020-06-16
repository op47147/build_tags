#!/bin/bash

find_files=`find .   -name ".repo" -prune -o -name "out" -prune -o -name "qemu" -prune \
        -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" \
        -o -name "*.h" -o -name "*.hpp"  \
        -o -name "Makefile" -o -name "*.mk" \
        -o -name "*.sh" -o -name "*.rc" \
        -o -name "*.py" \
        -o -name "*.pl" \
        -o -name "*.java" `
echo > cscope.list
for a_file in $find_files; do
        if [ ! -L $a_file ]; then
                if [ -f $a_file ]; then
                        echo $a_file >> cscope.list
                fi
        fi
done
cscope -bkq -i cscope.list
ctags -L cscope.list
