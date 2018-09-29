#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Install some CTF (Capture the Flag) tools\n\n"

declare -a FORMULAS=(
   "pv"
   "socat"
   "knock"
   "john"
   "pwgen"
   "hashcat"
   "hashpump"
   "fcrackzip"
   "hydra"                # Password kracking tool
)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done

# Hashcat
# Benchmark
# hashcat -m2500 -b
# Usage
# hashcat -m2500 file.hccap dictionary
