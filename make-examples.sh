#!zsh

# Usage:
#   ./make-examples.sh [VERSION [COUNT [MODULE [OUTPUT]]]]

set -e

VERSION=${1:-original}
COUNT=${2:-20}
MODULE=${3:-16}
OUTPUT=${4:-./output}

mkdir -p $OUTPUT
# Uncomment the following line if you want this script to remove the current contents of the OUTPUT directory
# rm -rf $OUTPUT/* || true
for ((i = 0; i < $COUNT; i++)) do
  swift run -c release LifeHashTool -v $VERSION -m $MODULE -p $OUTPUT
done
