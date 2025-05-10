#!/bin/bash

TEMPLATE="template.md"
ENCODING="UTF-8"

DATE=$(date +"%Y%m%d%H%M%S")
CREATED=$(date +"%Y-%m-%d %H:%M:%S")
UPDATED=$(date +"%Y-%m-%d %H:%M:%S")

FILEPATH="${DATE}.md"
cp "$TEMPLATE" "$FILEPATH"

sed -i "s/{UID}/$DATE/g" "$FILEPATH"
sed -i "s/{CREATED}/$CREATED/g" "$FILEPATH"
sed -i "s/{UPDATED}/$UPDATED/g" "$FILEPATH"

echo "$FILEPATH"