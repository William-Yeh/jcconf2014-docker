#!/bin/bash
#
# Run redis-benchmark on Docker (Ubuntu Linux).
#

LOOP_COUNT=${1:-10}
OUTPUT=${2:-result.docker}


echo "==> Start the Redis server..."
docker run -d  --name redis  -v `pwd`:/data  williamyeh/redis  start
#docker run -d  --name redis  williamyeh/redis  start


echo "==> Warm up Redis server..."
for ((i = 0; i < LOOP_COUNT; i++)); do
    docker run -t --rm  --link redis:redis  williamyeh/redis  benchmark
done


echo "==> Flush Redis server..."
docker run -t --rm  --link redis:redis  williamyeh/redis  \
    bash -c 'redis-cli -h $REDIS_PORT_6379_TCP_ADDR flushall'


echo "==> Record the benchmark result..."
docker run --rm  --link redis:redis  williamyeh/redis  benchmark --csv \
    > $OUTPUT

cat $OUTPUT

echo "==> Done!"
