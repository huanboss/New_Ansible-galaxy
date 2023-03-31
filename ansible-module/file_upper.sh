#!/bin/bash

# cat <<EOF
# {
#     "content": "Hello World"
# }
# EOF

source $1
original=$(cat $file)
content=$(echo $original | tr '[:lower:]' '[:upper:]')
if [[ "$original" == "$content" ]]; then
CHANGED="false"
else
CHANGED="true"
echo $content > $file
fi
cat <<EOF
{"changed":$CHANGED, "content":"$content"}

EOF