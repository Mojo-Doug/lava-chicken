#!/bin/bash
# Lava Chicken — Bitcoin solo lottery miner
# Usage: bash mine.sh YOUR_BTC_ADDRESS

BTC_ADDRESS="${1:-bc1qww8mcvyv8vsphw6ycypryamtlznwh8xk03gg8m}"

WORKER="lava_chicken"
POOL="stratum+tcp://solo.ckpool.org:3333"
THREADS=$(nproc)

echo "=== Lava Chicken Starting ==="
echo "Address : $BTC_ADDRESS"
echo "Pool    : $POOL"
echo "Threads : $THREADS"
echo "Monitor : https://solo.ckpool.org/users/$BTC_ADDRESS"
echo ""

# Build image if not already built
if ! docker image inspect lava-chicken &>/dev/null; then
  echo "Building miner image (first run, takes ~2 min)..."
  docker build -t lava-chicken .
fi

docker run --rm -it lava-chicken \
  -a sha256d \
  -o "$POOL" \
  -u "${BTC_ADDRESS}.${WORKER}" \
  -p x \
  -t "$THREADS"
