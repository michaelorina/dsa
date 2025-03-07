#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

TODAY=$(date +'%d-%m')

rm -rf latest
ln -sfn "$TODAY" latest
go mod tidy

echo ""
echo -e "${GREEN}✅ Updated symlink: latest -> $TODAY${RESET}"

TOTAL_TESTS=0
TOTAL_PASSED=0

calculate_percentage() {
    local total=$1
    local passed=$2
    local percentage=100

    if [ "$total" -gt 0 ]; then
        percentage=$((passed * 100 / total))
    fi

    if [ "$percentage" -eq 100 ]; then
        echo -e "${GREEN}✅ $passed/$total tests passed ($percentage% success rate).${RESET}"
    elif [ "$percentage" -ge 50 ]; then
        echo -e "${YELLOW}⚠️  $passed/$total tests passed ($percentage% success rate).${RESET}"
    else
        echo -e "${RED}❌ $passed/$total tests passed ($percentage% success rate).${RESET}"
    fi
}

echo "-------------------------------------------"
echo ""

# 🔍 Run C tests (Show each test)
echo -e "${BLUE}🔍 Running C tests...${RESET}"
echo ""
C_TOTAL=0
C_PASSED=0
for file in tests/c/*.c; do
    if [ -f "$file" ]; then
        test_name=$(basename "$file" .c)
        output_file="${file%.c}"

        echo -e "${CYAN}▶ Running C test: $test_name${RESET}"
        gcc "$file" -o "$output_file" && ./"$output_file"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ $test_name PASSED${RESET}"
            ((C_PASSED++))
            echo ""
        else
            echo -e "${RED}❌ $test_name FAILED${RESET}"
            echo ""
        fi
        ((C_TOTAL++))
    fi
done
calculate_percentage "$C_TOTAL" "$C_PASSED"

echo "-------------------------------------------"
echo ""
# 🐍 Run Python tests (Show each test)
echo -e "${CYAN}🐍 Running Python tests...${RESET}"
export PYTHONPATH=$(pwd)

PYTHON_OUTPUT=$(pytest -v --tb=short | tee /dev/tty)

PYTHON_TOTAL=$(echo "$PYTHON_OUTPUT" | grep -Eo '[0-9]+ passed' | awk '{print $1}' || echo 0)
PYTHON_PASSED=$PYTHON_TOTAL

if [[ -z "$PYTHON_TOTAL" ]]; then
    PYTHON_TOTAL=0
fi

if [[ -z "$PYTHON_PASSED" ]]; then
    PYTHON_PASSED=0
fi

calculate_percentage "$PYTHON_TOTAL" "$PYTHON_PASSED"


echo "-------------------------------------------"
echo ""

# 🚀 Run Go tests
echo -e "${YELLOW}🚀 Running Go tests...${RESET}"
echo ""
GO_OUTPUT=$(go test -v ./tests/go/... | tee /dev/tty)

GO_TOTAL=$(echo "$GO_OUTPUT" | grep -c "^=== RUN")
GO_PASSED=$(echo "$GO_OUTPUT" | grep -c "^--- PASS")

calculate_percentage "$GO_TOTAL" "$GO_PASSED"

echo "-------------------------------------------"
echo ""

# ✅ Final summary
TOTAL_TESTS=$((C_TOTAL + PYTHON_TOTAL + GO_TOTAL))
TOTAL_PASSED=$((C_PASSED + PYTHON_PASSED + GO_PASSED))

echo -e "${BOLD}🎯 Final Summary:${RESET}"
echo ""
calculate_percentage "$TOTAL_TESTS" "$TOTAL_PASSED"

if [ "$TOTAL_TESTS" -eq "$TOTAL_PASSED" ]; then
    echo -e "${GREEN}✅ All tests completed successfully!${RESET}"
else
    echo -e "${RED}❌ Some tests failed!${RESET}"
fi

echo ""
