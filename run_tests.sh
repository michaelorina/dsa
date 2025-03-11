#!/bin/bash

# ---------------------------
# 🌟 DSA Test Runner Script
# ---------------------------

# 🎨 Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

TODAY=$(date +'%d-%m')
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/test_results_$TODAY.log"

# 📁 Create logs directory if it doesn't exist
mkdir -p "$LOG_DIR"

# 📓 Start log file
echo "==========================" > "$LOG_FILE"
echo "Test Run - $TODAY" >> "$LOG_FILE"
echo "==========================" >> "$LOG_FILE"

# 🔗 Update symlink
rm -rf latest
ln -sfn "$TODAY" latest
go mod tidy > /dev/null 2>&1

echo ""
echo -e "${GREEN}✅ Updated symlink: latest -> $TODAY${RESET}"
echo "-------------------------------------------" | tee -a "$LOG_FILE"

TOTAL_TESTS=0
TOTAL_PASSED=0

# 📊 Percentage calculation utility
calculate_percentage() {
    local total=$1
    local passed=$2
    local percentage=0

    if [ "$total" -gt 0 ]; then
        percentage=$((passed * 100 / total))
    fi

    local summary="$passed/$total tests passed ($percentage% success rate)"

    if [ "$percentage" -eq 100 ]; then
        echo -e "${GREEN}✅ $summary${RESET}"
        echo "✅ $summary" >> "$LOG_FILE"
    elif [ "$percentage" -ge 50 ]; then
        echo -e "${YELLOW}⚠️  $summary${RESET}"
        echo "⚠️  $summary" >> "$LOG_FILE"
    else
        echo -e "${RED}❌ $summary${RESET}"
        echo "❌ $summary" >> "$LOG_FILE"
    fi
}

# ---------------------------
# 🔍 C Tests
# ---------------------------
echo -e "\n${BLUE}🔍 Running C tests...${RESET}" | tee -a "$LOG_FILE"

C_TOTAL=0
C_PASSED=0

for file in tests/c/*.c; do
    [ ! -f "$file" ] && continue

    test_name=$(basename "$file" .c)
    output_file="${file%.c}"

    echo -e "${CYAN}▶ Running C test: $test_name${RESET}" | tee -a "$LOG_FILE"
    gcc "$file" -o "$output_file" -lm 2>> "$LOG_FILE"

    if ./"$output_file" >> "$LOG_FILE" 2>&1; then
        echo -e "${GREEN}✅ $test_name PASSED${RESET}" | tee -a "$LOG_FILE"
        ((C_PASSED++))
    else
        echo -e "${RED}❌ $test_name FAILED${RESET}" | tee -a "$LOG_FILE"
    fi
    ((C_TOTAL++))
done

calculate_percentage "$C_TOTAL" "$C_PASSED"
TOTAL_TESTS=$((TOTAL_TESTS + C_TOTAL))
TOTAL_PASSED=$((TOTAL_PASSED + C_PASSED))

# ---------------------------
# 🐍 Python Tests
# ---------------------------
echo -e "\n${CYAN}🐍 Running Python tests...${RESET}" | tee -a "$LOG_FILE"

export PYTHONPATH=$(pwd)

PYTHON_OUTPUT=$(pytest tests/py --tb=short -v 2>&1 | tee -a "$LOG_FILE")
PYTHON_PASSED=$(echo "$PYTHON_OUTPUT" | grep -oE '[0-9]+ passed' | awk '{s+=$1} END {print s}')
PYTHON_TOTAL=$(echo "$PYTHON_OUTPUT" | grep -oE '[0-9]+ (passed|failed|error)' | awk '{s+=$1} END {print s}')

PYTHON_PASSED=${PYTHON_PASSED:-0}
PYTHON_TOTAL=${PYTHON_TOTAL:-0}

calculate_percentage "$PYTHON_TOTAL" "$PYTHON_PASSED"
TOTAL_TESTS=$((TOTAL_TESTS + PYTHON_TOTAL))
TOTAL_PASSED=$((TOTAL_PASSED + PYTHON_PASSED))

# ---------------------------
# 🚀 Go Tests
# ---------------------------
echo -e "\n${YELLOW}🚀 Running Go tests...${RESET}" | tee -a "$LOG_FILE"

GO_OUTPUT=$(go test -v ./tests/go/... 2>&1 | tee -a "$LOG_FILE")
GO_TOTAL=$(echo "$GO_OUTPUT" | grep -c "^=== RUN")
GO_PASSED=$(echo "$GO_OUTPUT" | grep -c "^--- PASS")

calculate_percentage "$GO_TOTAL" "$GO_PASSED"
TOTAL_TESTS=$((TOTAL_TESTS + GO_TOTAL))
TOTAL_PASSED=$((TOTAL_PASSED + GO_PASSED))

# ---------------------------
# 🎯 Final Summary
# ---------------------------
echo -e "\n${BOLD}🎯 Final Summary:${RESET}" | tee -a "$LOG_FILE"
calculate_percentage "$TOTAL_TESTS" "$TOTAL_PASSED"

if [ "$TOTAL_TESTS" -eq "$TOTAL_PASSED" ]; then
    echo -e "${GREEN}✅ All tests completed successfully!${RESET}" | tee -a "$LOG_FILE"
else
    echo -e "${RED}❌ Some tests failed!${RESET}" | tee -a "$LOG_FILE"
fi

echo -e "\n📄 Full log saved to: ${YELLOW}$LOG_FILE${RESET}"
