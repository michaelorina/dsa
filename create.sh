#!/bin/bash

TODAY=$(date +'%d-%m')

if [ ! -d "$TODAY" ]; then
    echo "📂 Creating today's folder: $TODAY"
    mkdir -p "$TODAY/arrays/go" "$TODAY/search/go"
fi

declare -a function_files=("arrays/arrays.c" "arrays/arrays.py" "arrays/go/arrays.go"
    "search/search.c" "search/search.py" "search/go/search.go")

declare -a test_files=("tests/test_arrays.c" "tests/test_arrays.py" "tests/go/arrays_test.go"
    "tests/test_search.c" "tests/test_search.py" "tests/go/search_test.go")

for file in "${function_files[@]}"; do
    if [ ! -f "$TODAY/$file" ]; then
        echo "📄 Creating function file: $TODAY/$file"
        touch "$TODAY/$file"
    fi
done

for test_file in "${test_files[@]}"; do
    if [ ! -f "$test_file" ]; then
        echo "📝 Creating test file: $test_file"
        touch "$test_file"
    fi
done

rm -rf latest
ln -sfn "$TODAY" latest
go mod tidy

echo "✅ Updated symlink: latest -> $TODAY"
echo "Setup complete!"
