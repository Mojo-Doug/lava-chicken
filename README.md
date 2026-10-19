# Lava Chicken 🐔

Bitcoin solo lottery mining experiment. Paying a few cents/hr for an astronomically small chance at ~3.125 BTC.

## The Math (honest)

- Network hashrate: ~700 exahashes/sec
- This miner (CPU, 8 cores): ~1-5 megahashes/sec  
- Odds of winning any given block: roughly 1 in 140 trillion
- Expected time to win: ~100,000+ years
- Block reward if you win: 3.125 BTC (~$300k+)

It's a lottery ticket. Treat it like one.

## Cost

RunPod CPU pod: ~$0.07–$0.15/hr. Run it when you feel like it, kill it when you don't.

## Setup (RunPod)

1. Create a RunPod pod — cheapest CPU instance works fine (no GPU needed)
2. Open a terminal in the pod
3. Clone this repo: `git clone https://github.com/YOUR_GITHUB/lava-chicken`
4. Run: `bash mine.sh`

## How It Works

- Connects to [CK Solo Pool](https://ckpool.org) (`solo.ckpool.org:3333`)
- CK Solo takes 2% fee — only if you actually win a block, zero otherwise
- Your node mines independently; if it finds a valid block hash, you get the full reward
- Monitor: https://solo.ckpool.org/users/bc1qww8mcvyv8vsphw6ycypryamtlznwh8xk03gg8m

## Files

- `mine.sh` — start mining (address pre-configured)
- `Dockerfile` — builds cpuminer-multi from source
- `cost_log.md` — manual log of time spent and cost
