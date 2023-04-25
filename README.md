# State of Node.js Performance 2023

This report was separated into three groups:

1. Node.js Internal Benchmark
2. HTTP Servers
3. Node.js Common Operations

## Setup

```console
cd ~/repos/node
nvm install v20.0.0
cp $(which node) ./node20
nvm install v18.16.0
cp $(which node) ./node18
nvm install v16.20.0
cp $(which node) ./node16
```

## Node.js Internal Benchmark

1. Node.js Internal Benchmark


### `fs`

```console
➜  state-of-nodejs-performance-2023 (main) node-benchmark-compare compare-fs-16-18.csv                                                                                                                                                                    ✭ ✱
                                                                              confidence improvement accuracy (*)   (**)  (***)
fs/bench-opendir.js bufferSize=1024 mode='async' dir='test/parallel' n=100           ***     -0.61 %       ±0.26% ±0.34% ±0.45%
fs/bench-opendir.js bufferSize=32 mode='async' dir='test/parallel' n=100             ***     -2.29 %       ±0.28% ±0.37% ±0.49%
fs/bench-readdir.js withFileTypes='false' dir='test/parallel' n=10                   ***     -5.90 %       ±0.22% ±0.30% ±0.39%
fs/bench-realpath.js pathType='relative' n=10000                                     ***      1.61 %       ±0.85% ±1.14% ±1.48%
fs/bench-stat-promise.js statType='fstat' n=200000                                   ***     -2.17 %       ±0.81% ±1.08% ±1.41%
fs/bench-stat-promise.js statType='lstat' n=200000                                   ***     -2.40 %       ±0.90% ±1.20% ±1.56%
fs/bench-stat-promise.js statType='stat' n=200000                                    ***     -1.86 %       ±0.98% ±1.30% ±1.70%
fs/readfile.js concurrent=1 len=16777216 encoding='ascii' duration=5                 ***     67.59 %       ±3.80% ±5.12% ±6.79%
fs/readfile.js concurrent=1 len=16777216 encoding='utf-8' duration=5                 ***     11.97 %       ±1.09% ±1.46% ±1.93%
fs/writefile-promises.js concurrent=1 size=1024 encodingType='utf' duration=5                 0.36 %       ±0.56% ±0.75% ±0.97%

➜  state-of-nodejs-performance-2023 (main) node-benchmark-compare compare-fs-18-20.csv                                                                                                                                                                    ✭ ✱
                                                                              confidence improvement accuracy (*)   (**)  (***)
fs/bench-opendir.js bufferSize=1024 mode='async' dir='test/parallel' n=100           ***      3.48 %       ±0.22% ±0.30% ±0.39%
fs/bench-opendir.js bufferSize=32 mode='async' dir='test/parallel' n=100             ***      7.86 %       ±0.29% ±0.39% ±0.50%
fs/bench-readdir.js withFileTypes='false' dir='test/parallel' n=10                   ***      8.69 %       ±0.22% ±0.30% ±0.39%
fs/bench-realpath.js pathType='relative' n=10000                                     ***      5.13 %       ±0.97% ±1.29% ±1.69%
fs/bench-stat-promise.js statType='fstat' n=200000                                            0.70 %       ±0.70% ±0.93% ±1.22%
fs/bench-stat-promise.js statType='lstat' n=200000                                            0.64 %       ±0.77% ±1.02% ±1.34%
fs/bench-stat-promise.js statType='stat' n=200000                                             0.67 %       ±0.85% ±1.13% ±1.47%
fs/readfile.js concurrent=1 len=16777216 encoding='ascii' duration=5                 ***    -27.30 %       ±4.27% ±5.75% ±7.63%
fs/readfile.js concurrent=1 len=16777216 encoding='utf-8' duration=5                 ***      3.25 %       ±0.61% ±0.81% ±1.06%
fs/writefile-promises.js concurrent=1 size=1024 encodingType='utf' duration=5                -0.34 %       ±0.54% ±0.72% ±0.94%

➜  state-of-nodejs-performance-2023 (main) node-benchmark-compare compare-fs-16-20.csv                                                                                                                                                                    ✭ ✱
                                                                              confidence improvement accuracy (*)    (**)   (***)
fs/bench-opendir.js bufferSize=1024 mode='async' dir='test/parallel' n=100           ***      2.79 %       ±0.26%  ±0.35%  ±0.46%
fs/bench-opendir.js bufferSize=32 mode='async' dir='test/parallel' n=100             ***      5.41 %       ±0.27%  ±0.35%  ±0.46%
fs/bench-readdir.js withFileTypes='false' dir='test/parallel' n=10                   ***      2.19 %       ±0.26%  ±0.35%  ±0.45%
fs/bench-realpath.js pathType='relative' n=10000                                     ***      6.86 %       ±0.94%  ±1.26%  ±1.64%
fs/bench-stat-promise.js statType='fstat' n=200000                                   ***     -1.67 %       ±0.72%  ±0.96%  ±1.24%
fs/bench-stat-promise.js statType='lstat' n=200000                                   ***     -1.59 %       ±0.84%  ±1.13%  ±1.47%
fs/bench-stat-promise.js statType='stat' n=200000                                    ***     -2.13 %       ±0.87%  ±1.17%  ±1.52%
fs/readfile.js concurrent=1 len=16777216 encoding='ascii' duration=5                 ***     21.96 %       ±7.96% ±10.63% ±13.92%
fs/readfile.js concurrent=1 len=16777216 encoding='utf-8' duration=5                 ***     15.55 %       ±1.09%  ±1.46%  ±1.92%
fs/writefile-promises.js concurrent=1 size=1024 encodingType='utf' duration=5                 0.07 %       ±0.51%  ±0.68%  ±0.89%
```

### `events`

// TODO where we use EventTarget?


```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-events-16-18.csv
                                                                 confidence improvement accuracy (*)   (**)  (***)
events/ee-add-remove.js n=1000000 removeListener=0 newListener=0        ***      5.37 %       ±0.42% ±0.56% ±0.74%
events/ee-add-remove.js n=1000000 removeListener=0 newListener=1        ***      6.45 %       ±0.70% ±0.93% ±1.21%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=0        ***      3.55 %       ±0.56% ±0.75% ±0.98%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=1        ***      7.66 %       ±0.70% ±0.93% ±1.22%
events/ee-emit.js listeners=5 argc=2 n=2000000                          ***      9.93 %       ±1.24% ±1.66% ±2.17%
events/ee-once.js argc=0 n=20000000                                     ***      7.06 %       ±0.46% ±0.62% ±0.80%
events/eventtarget-add-remove.js nListener=10 n=1000000                   *      2.18 %       ±1.70% ±2.29% ±3.03%
events/eventtarget-add-remove.js nListener=5 n=1000000                           1.80 %       ±2.88% ±3.86% ±5.08%
events/eventtarget.js listeners=1 n=1000000                             ***     14.06 %       ±0.51% ±0.68% ±0.88%
events/eventtarget.js listeners=10 n=1000000                            ***     10.18 %       ±0.28% ±0.37% ±0.49%
events/eventtarget.js listeners=5 n=1000000                             ***     13.35 %       ±0.24% ±0.32% ±0.42%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-events-18-20.csv
                                                                 confidence improvement accuracy (*)   (**)  (***)
events/ee-add-remove.js n=1000000 removeListener=0 newListener=0        ***     -5.53 %       ±0.44% ±0.59% ±0.77%
events/ee-add-remove.js n=1000000 removeListener=0 newListener=1        ***     -2.70 %       ±1.20% ±1.60% ±2.10%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=0                 0.89 %       ±1.03% ±1.38% ±1.82%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=1        ***     -6.01 %       ±1.31% ±1.76% ±2.32%
events/ee-emit.js listeners=5 argc=2 n=2000000                           **      1.38 %       ±1.01% ±1.35% ±1.75%
events/ee-once.js argc=0 n=20000000                                     ***    -10.96 %       ±0.44% ±0.59% ±0.77%
events/eventtarget-add-remove.js nListener=10 n=1000000                          0.02 %       ±1.44% ±1.93% ±2.52%
events/eventtarget-add-remove.js nListener=5 n=1000000                    *      1.79 %       ±1.62% ±2.15% ±2.80%
events/eventtarget.js listeners=1 n=1000000                             ***    213.60 %       ±2.46% ±3.32% ±4.40%
events/eventtarget.js listeners=10 n=1000000                            ***    151.44 %       ±1.80% ±2.42% ±3.21%
events/eventtarget.js listeners=5 n=1000000                             ***    181.52 %       ±1.95% ±2.62% ±3.48%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-events-16-20.csv
                                                                 confidence improvement accuracy (*)   (**)  (***)
events/ee-add-remove.js n=1000000 removeListener=0 newListener=0         **     -0.45 %       ±0.32% ±0.42% ±0.55%
events/ee-add-remove.js n=1000000 removeListener=0 newListener=1        ***      3.41 %       ±1.26% ±1.69% ±2.22%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=0        ***      3.92 %       ±0.54% ±0.72% ±0.94%
events/ee-add-remove.js n=1000000 removeListener=1 newListener=1                 1.39 %       ±1.45% ±1.94% ±2.55%
events/ee-emit.js listeners=5 argc=2 n=2000000                          ***     11.49 %       ±1.37% ±1.83% ±2.38%
events/ee-once.js argc=0 n=20000000                                     ***     -4.35 %       ±0.47% ±0.62% ±0.81%
events/eventtarget-add-remove.js nListener=10 n=1000000                 ***      3.80 %       ±0.83% ±1.11% ±1.46%
events/eventtarget-add-remove.js nListener=5 n=1000000                  ***      6.41 %       ±1.54% ±2.05% ±2.67%
events/eventtarget.js listeners=1 n=1000000                             ***    259.34 %       ±2.83% ±3.81% ±5.05%
events/eventtarget.js listeners=10 n=1000000                            ***    176.98 %       ±1.97% ±2.65% ±3.52%
events/eventtarget.js listeners=5 n=1000000                             ***    219.14 %       ±2.20% ±2.97% ±3.94%
```

### `http`

// TODO: Why 112%? How to simulate it in real-world applications?

```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-http-16-18.csv
                                                                                                             confidence improvement accuracy (*)   (**)  (***)
http/bench-parser.js n=100000 len=8                                                                                 ***      2.23 %       ±0.57% ±0.76% ±1.00%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='buffer' benchmarker='test-double-http'        ***      8.42 %       ±1.36% ±1.82% ±2.36%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='bytes' benchmarker='test-double-http'         ***      8.70 %       ±1.17% ±1.56% ±2.03%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-http-18-20.csv
                                                                                                             confidence improvement accuracy (*)   (**)  (***)
http/bench-parser.js n=100000 len=8                                                                                 ***     11.54 %       ±0.65% ±0.87% ±1.13%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='buffer' benchmarker='test-double-http'        ***     96.13 %       ±2.71% ±3.64% ±4.78%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='bytes' benchmarker='test-double-http'         ***     92.86 %       ±2.55% ±3.42% ±4.51%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-http-16-20.csv
                                                                                                             confidence improvement accuracy (*)   (**)  (***)
http/bench-parser.js n=100000 len=8                                                                                 ***     14.12 %       ±0.55% ±0.74% ±0.96%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='buffer' benchmarker='test-double-http'        ***    112.66 %       ±2.92% ±3.91% ±5.15%
http/simple.js duration=10 chunkedEnc=0 c=100 chunks=4 len=1024 type='bytes' benchmarker='test-double-http'         ***    108.94 %       ±2.82% ±3.78% ±4.97%
```
  * `misc`
  * `module`
  * `streams`
  * `url`
  * `buffers`

```console
$ ./benchmark.sh
```

## HTTP Servers

2. HTTP Servers
  * `fastify`
  * `express`

Express

```bash
# Replace ./node16 to all Node.js matrix (node16, node18, node20)
./node16 server/express.js
npx autocannon -c 500 -d 120 -W [ -c 50 -d 5 ] http://localhost:3000
```

Fastify

```bash
# Replace ./node16 to all Node.js matrix (node16, node18, node20)
./node16 server/fastify.js
npx autocannon -c 500 -d 120 -W [ -c 50 -d 5 ] http://localhost:3000
```

## Node.js Common Operations

3. Node.js Common Operations

Repository: https://github.com/RafaelGSS/nodejs-bench-operations.git
*Action executed in the dedicated host
