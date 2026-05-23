#!/bin/bash

URL="http://localhost:5000"

echo "Checking Application Health..."

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ $STATUS_CODE -eq 200 ]
then
    echo "Application is Healthy ✅"
    exit 0
else
    echo "Application is DOWN ❌"
    exit 1
fi