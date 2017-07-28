#!/bin/bash

echo "$1" | base64 -d | gzip -d | python -m json.tool
