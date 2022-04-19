#!/bin/bash
#Takes the given array, reverses and prints out without any duplicates.

declare -a ARRAY=(`cat array`)

echo ${ARRAY[@]} | tr ' ' '\n' | awk '{ a[i++] = $0 } END { for (j=i-1; j>=0;) print a[j--] }' | awk '!v[$0]++' | tr '\n' ' '

: <<'COMMENT_BLOCK'

EXPLANATION:

tr ' ' '\n' : translates spaces into newlines

awk '{ a[i++] = $0 } : records all lines in array

END { for (j=i-1; j>=0;) print a[j--] }'  : loops over lines, prints from last to first.

awk '!v[$0]++' : prints line if it is unique

tr '\n' ' ' : places newlines back as spaces.

COMMENT_BLOCK

exit 0

