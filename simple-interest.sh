#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./simple-interest.sh [-p principal] [-r rate] [-t time]

Flags:
  -p    Principal amount (e.g., 1000 or 1000.50)
  -r    Annual rate of interest in percent (e.g., 7.5)
  -t    Time in years (e.g., 2 or 2.5)
  -h    Show this help

If any flag is omitted, the script will prompt for it interactively.
Formula: Simple Interest = (Principal * Rate * Time) / 100
EOF
}

is_number() {
  # Accept integers or decimals
  [[ "${1:-}" =~ ^[0-9]+([.][0-9]+)?$ ]]
}

P=""; R=""; T=""

while getopts ":p:r:t:h" opt; do
  case $opt in
    p) P="$OPTARG" ;;
    r) R="$OPTARG" ;;
    t) T="$OPTARG" ;;
    h) usage; exit 0 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage; exit 1 ;;
    :) echo "Option -$OPTARG requires an argument." >&2; usage; exit 1 ;;
  esac
done

# Prompt interactively if not supplied
if [[ -z "$P" ]]; then
  read -r -p "Enter Principal: " P
fi
if [[ -z "$R" ]]; then
  read -r -p "Enter Rate of Interest: " R
fi
if [[ -z "$T" ]]; then
  read -r -p "Enter Time (in years): " T
fi

# Validate inputs
for val in "$P" "$R" "$T"; do
  if ! is_number "$val"; then
    echo "Error: All inputs must be numeric (integers or decimals). Got: '$val'" >&2
    exit 1
  fi
done

# Calculate using awk for floating point precision
SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
TOTAL=$(awk -v p="$P" -v si="$SI" 'BEGIN { printf "%.2f", p+si }')

echo "Principal: $P"
echo "Rate: $R"
echo "Time: $T"
echo "Simple Interest = $SI"
echo "Total Amount  = $TOTAL"
