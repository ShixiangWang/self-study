#!/usr/bin/env bash

# 快速失败并检查退出状态
set -eu -o pipefail

PRG="rna.py"
for FILE in solution*.py; do
    echo "==>$(FILE)<=="
    cp "$FILE" "$PRG"
    make test
done

echo "Done."
