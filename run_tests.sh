#!/bin/bash

TODAY=$(date +'%d-%m')

rm -rf latest
ln -sfn "$TODAY" latest
go mod tidy

echo "✅ Updated symlink: latest -> $TODAY"

TOTAL_TESTS=0
TOTAL_PASSED=0

calculate_percentage() {
    if [ "$1" -gt 0 ]; then
        PERCENTAGE=$(( $2 * 100 / $1 ))
    else
        PERCENTAGE=100 
    fi
    echo "✅ $2/$1 tests passed ($PERCENTAGE% success rate)."
}

# 🔍 Run C tests
echo "🔍 Running C tests..."
C_TOTAL=0
C_PASSED=0
for file in tests/c/*.c; do
    if [ -f "$file" ]; then
        output_file="${file%.c}"
        gcc "$file" -o "$output_file" && ./"$output_file"
        if [ $? -eq 0 ]; then
            ((C_PASSED++))
        fi
        ((C_TOTAL++))
    fi
done
calculate_percentage "$C_TOTAL" "$C_PASSED"

# 🐍 Run Python tests
echo "🐍 Running Python tests..."
PYTHON_OUTPUT=$(pytest --tb=short --quiet | tee /dev/tty)
PYTHON_TOTAL=$(echo "$PYTHON_OUTPUT" | grep -c "collected")
PYTHON_PASSED=$(echo "$PYTHON_OUTPUT" | grep -c "PASSED")

calculate_percentage "$PYTHON_TOTAL" "$PYTHON_PASSED"

# 🚀 Run Go tests
echo "🚀 Running Go tests..."
GO_OUTPUT=$(go test -v ./tests/go/... | tee /dev/tty)
GO_TOTAL=$(echo "$GO_OUTPUT" | grep -c "RUN")
GO_PASSED=$(echo "$GO_OUTPUT" | grep -c "--- PASS")

calculate_percentage "$GO_TOTAL" "$GO_PASSED"

# ✅ Final summary
TOTAL_TESTS=$((C_TOTAL + PYTHON_TOTAL + GO_TOTAL))
TOTAL_PASSED=$((C_PASSED + PYTHON_PASSED + GO_PASSED))

echo "🎯 Final Summary: "
calculate_percentage "$TOTAL_TESTS" "$TOTAL_PASSED"
echo "✅ All tests completed!"
