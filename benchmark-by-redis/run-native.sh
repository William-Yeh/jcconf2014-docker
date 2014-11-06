#!/bin/bash
#
# Run redis-benchmark natively (on Ubuntu Linux).
#

LOOP_COUNT=${1:-10}
OUTPUT=${2:-result.native}


echo "==> Start the Redis server..."
sudo service redis-server start


echo "==> Warm up Redis server..."
for ((i = 0; i < LOOP_COUNT; i++)); do
    redis-benchmark
done


echo "==> Flush Redis server..."
redis-cli flushall


echo "==> Record the benchmark result..."
redis-benchmark --csv > $OUTPUT

cat $OUTPUT

echo "==> Done!"
