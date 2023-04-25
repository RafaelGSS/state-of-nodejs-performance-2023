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
  * `fs`

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

  * `events`
  * `http`
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
