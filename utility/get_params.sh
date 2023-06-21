#!/bin/bash
while test $# -gt 0; do
  case "$1" in
    -s|-sample)
      shift
      SAMPLE=$1
      shift
      ;;
    -r|-reference)
      shift
      REFERENCE=$1
      shift
      ;;
    -n|-name)
      shift
      NAME=$1
      shift
      ;;
    *)
        break
  esac
done
if test -z "$REFERENCE" || test -z "$SAMPLE" || test -z "$NAME" 
then
    echo 'reference or sample not provided'
    exit 0

else
      echo "$REFERENCE"
      echo "$SAMPLE"
      echo "$NAME"
fi
