#!/bin/bash
# Lava Chicken — Bitcoin solo lottery miner
# Usage: bash mine.sh
# Runs in background — survives terminal disconnect

BTC_ADDRESS="bc1qww8mcvyv8vsphw6ycypryamtlznwh8xk03gg8m"
WORKER="lava_chicken"
POOL="stratum+tcp://solo.ckpool.org:3333"
THREADS=$(nproc)
LOG="/var/log/lava-chicken.log"
BINARY="/cpuminer/cpuminer"

echo "=== Lava Chicken ==="
echo "Address : $BTC_ADDRESS"
echo "Pool    : $POOL"
echo "Threads : $THREADS"
echo "Monitor : https://solo.ckpool.org/users/$BTC_ADDRESS"
echo "Log     : $LOG"
echo ""

# Build if binary doesn't exist
if [ ! -f "$BINARY" ]; then
  echo "Building cpuminer-multi (takes ~2 min)..."
  apt-get install -y build-essential libssl-dev libcurl4-openssl-dev \
    libjansson-dev libgmp-dev automake git -qq
  git clone https://github.com/tpruvot/cpuminer-multi /cpuminer
  cd /cpuminer && ./build.sh
  cd /
fi

# Kill any existing instance
pkill -f cpuminer 2>/dev/null && echo "Stopped previous miner."

# Start in background — survives terminal disconnect
nohup "$BINARY" \
  -a sha256d \
  -o "$POOL" \
  -u "${BTC_ADDRESS}.${WORKER}" \
  -p x \
  -t "$THREADS" \
  >> "$LOG" 2>&1 &

echo "Miner started (PID $!). Showing log — Ctrl+C is safe, miner keeps running."
echo ""
tail -f "$LOG"
