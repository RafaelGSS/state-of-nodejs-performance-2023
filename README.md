# State of Node.js Performance 2023

This report was separated into three groups:

1. Node.js Internal Benchmark
2. HTTP Servers
3. Node.js Common Operations

## Dedicated Host

* Dedicated Host on AWS
* Running a dedicated instance
  * c6i.xlarge (Ice Lake) 3,5 GHz - Computing Optimized
  * 4 vCPUs
  * 8 GB Mem

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

```console
$ ./benchmark.sh
```

### `fs` results

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

### `events` results

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

### `http` results

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
### `misc` results

// How to simulate it using `time`?

```console
➜  nodejs-internal-benchmark (main) node-benchmark-compare compare-misc-16-18.csv
                                                                                     confidence improvement accuracy (*)   (**)  (***)
misc/startup.js count=30 mode='process' script='benchmark/fixtures/require-builtins'        ***     12.99 %       ±0.14% ±0.19% ±0.25%
misc/startup.js count=30 mode='process' script='test/fixtures/semicolon'                    ***      5.88 %       ±0.15% ±0.20% ±0.26%
misc/startup.js count=30 mode='worker' script='benchmark/fixtures/require-builtins'         ***      5.26 %       ±0.14% ±0.19% ±0.25%
misc/startup.js count=30 mode='worker' script='test/fixtures/semicolon'                     ***      3.84 %       ±0.15% ±0.21% ±0.27%
misc/trace.js method='trace' n=100000                                                       ***      3.80 %       ±2.03% ±2.71% ±3.56%

➜  nodejs-internal-benchmark (main) node-benchmark-compare compare-misc-18-20.csv
                                                                                     confidence improvement accuracy (*)   (**)  (***)
misc/startup.js count=30 mode='process' script='benchmark/fixtures/require-builtins'        ***     -4.80 %       ±0.13% ±0.18% ±0.23%
misc/startup.js count=30 mode='process' script='test/fixtures/semicolon'                    ***     27.27 %       ±0.22% ±0.29% ±0.38%
misc/startup.js count=30 mode='worker' script='benchmark/fixtures/require-builtins'         ***      7.23 %       ±0.21% ±0.28% ±0.37%
misc/startup.js count=30 mode='worker' script='test/fixtures/semicolon'                     ***     31.26 %       ±0.33% ±0.44% ±0.58%
misc/trace.js method='trace' n=100000                                                       ***      2.39 %       ±1.00% ±1.34% ±1.76%

Updated file saved to compare-misc-16-20.csv
➜  nodejs-internal-benchmark (main) node-benchmark-compare compare-misc-16-20.csv
                                                                                     confidence improvement accuracy (*)   (**)  (***)
misc/startup.js count=30 mode='process' script='benchmark/fixtures/require-builtins'        ***      7.40 %       ±0.12% ±0.16% ±0.21%
misc/startup.js count=30 mode='process' script='test/fixtures/semicolon'                    ***     34.75 %       ±0.21% ±0.28% ±0.36%
misc/startup.js count=30 mode='worker' script='benchmark/fixtures/require-builtins'         ***     12.79 %       ±0.23% ±0.30% ±0.40%
misc/startup.js count=30 mode='worker' script='test/fixtures/semicolon'                     ***     36.40 %       ±0.34% ±0.46% ±0.60%
misc/trace.js method='trace' n=100000                                                       ***      7.05 %       ±0.99% ±1.32% ±1.73%
```

### `module` results

```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-module-16-18.csv
                                              confidence improvement accuracy (*)   (**)  (***)
module/module-require.js n=10000 type='.js'          ***      3.86 %       ±1.21% ±1.62% ±2.11%
module/module-require.js n=10000 type='.json'        ***      8.09 %       ±0.65% ±0.87% ±1.13%
module/module-require.js n=10000 type='dir'                  -0.21 %       ±0.57% ±0.76% ±1.00%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-module-18-20.csv
                                              confidence improvement accuracy (*)   (**)  (***)
module/module-require.js n=10000 type='.js'          ***      4.20 %       ±0.66% ±0.88% ±1.15%
module/module-require.js n=10000 type='.json'        ***      6.58 %       ±0.68% ±0.90% ±1.18%
module/module-require.js n=10000 type='dir'          ***      9.50 %       ±0.63% ±0.84% ±1.09%
```

### `streams` results

```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-streams-16-18.csv
                                                       confidence improvement accuracy (*)   (**)  (***)
streams/creation.js kind='duplex' n=50000000                  ***    -54.92 %       ±2.20% ±2.94% ±3.85%
streams/creation.js kind='readable' n=50000000                ***    -30.41 %       ±0.59% ±0.79% ±1.03%
streams/creation.js kind='transform' n=50000000                 *     -6.24 %       ±5.29% ±7.04% ±9.16%
streams/creation.js kind='writable' n=50000000                ***    -28.73 %       ±0.83% ±1.11% ±1.47%
streams/destroy.js kind='duplex' n=1000000                             0.61 %       ±0.79% ±1.05% ±1.36%
streams/destroy.js kind='readable' n=1000000                  ***     -1.82 %       ±0.60% ±0.80% ±1.04%
streams/destroy.js kind='transform' n=1000000                 ***      7.96 %       ±0.68% ±0.91% ±1.18%
streams/destroy.js kind='writable' n=1000000                  ***     -3.67 %       ±2.10% ±2.79% ±3.63%
streams/pipe.js n=5000000                                     ***    -48.74 %       ±0.66% ±0.88% ±1.16%
streams/readable-async-iterator.js sync='no' n=100000                 -0.54 %       ±0.77% ±1.02% ±1.33%
streams/readable-async-iterator.js sync='yes' n=100000                -0.64 %       ±0.81% ±1.08% ±1.41%
streams/readable-from.js n=10000000                                    0.30 %       ±1.46% ±1.96% ±2.59%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-streams-18-20.csv
                                                       confidence improvement accuracy (*)   (**)  (***)
streams/creation.js kind='duplex' n=50000000                  ***     12.76 %       ±4.30% ±5.73% ±7.47%
streams/creation.js kind='readable' n=50000000                ***      3.48 %       ±1.16% ±1.55% ±2.05%
streams/creation.js kind='transform' n=50000000                **     -7.59 %       ±5.27% ±7.02% ±9.16%
streams/creation.js kind='writable' n=50000000                ***      4.20 %       ±0.87% ±1.16% ±1.53%
streams/destroy.js kind='duplex' n=1000000                    ***     -6.33 %       ±1.08% ±1.43% ±1.87%
streams/destroy.js kind='readable' n=1000000                  ***     -1.94 %       ±0.70% ±0.93% ±1.21%
streams/destroy.js kind='transform' n=1000000                 ***     -7.44 %       ±0.93% ±1.24% ±1.62%
streams/destroy.js kind='writable' n=1000000                           0.20 %       ±1.89% ±2.52% ±3.29%
streams/pipe.js n=5000000                                     ***     87.18 %       ±2.58% ±3.46% ±4.56%
streams/readable-async-iterator.js sync='no' n=100000         ***      6.14 %       ±0.88% ±1.17% ±1.52%
streams/readable-async-iterator.js sync='yes' n=100000        ***      3.47 %       ±0.65% ±0.87% ±1.13%
streams/readable-from.js n=10000000                                   -1.10 %       ±2.25% ±3.01% ±3.94%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-streams-16-20.csv
                                                       confidence improvement accuracy (*)   (**)  (***)
streams/creation.js kind='duplex' n=50000000                  ***    -49.90 %       ±2.43% ±3.23% ±4.21%
streams/creation.js kind='readable' n=50000000                ***    -27.69 %       ±0.92% ±1.23% ±1.60%
streams/creation.js kind='transform' n=50000000               ***    -15.23 %       ±4.60% ±6.13% ±7.99%
streams/creation.js kind='writable' n=50000000                ***    -25.72 %       ±0.97% ±1.29% ±1.68%
streams/destroy.js kind='duplex' n=1000000                    ***     -5.62 %       ±1.05% ±1.40% ±1.83%
streams/destroy.js kind='readable' n=1000000                  ***     -3.73 %       ±0.69% ±0.92% ±1.19%
streams/destroy.js kind='transform' n=1000000                         -0.58 %       ±0.76% ±1.01% ±1.31%
streams/destroy.js kind='writable' n=1000000                  ***     -3.33 %       ±1.81% ±2.42% ±3.16%
streams/pipe.js n=5000000                                     ***     -3.74 %       ±1.40% ±1.88% ±2.46%
streams/readable-async-iterator.js sync='no' n=100000         ***      6.09 %       ±0.76% ±1.01% ±1.32%
streams/readable-async-iterator.js sync='yes' n=100000        ***      2.57 %       ±0.73% ±0.98% ±1.27%
streams/readable-from.js n=10000000                                   -0.28 %       ±2.08% ±2.79% ±3.69%
```

### `url` results

```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-url-16-18.csv
                                                                confidence improvement accuracy (*)   (**)  (***)
url/legacy-url-parse.js e=1 type='auth'                                ***     24.11 %       ±1.40% ±1.87% ±2.47%
url/legacy-url-parse.js e=1 type='dot'                                 ***     45.45 %       ±2.19% ±2.94% ±3.89%
url/legacy-url-parse.js e=1 type='file'                                ***     75.36 %       ±2.73% ±3.64% ±4.76%
url/legacy-url-parse.js e=1 type='idn'                                 ***     55.69 %       ±1.59% ±2.13% ±2.80%
url/legacy-url-parse.js e=1 type='javascript'                          ***     50.63 %       ±4.26% ±5.72% ±7.55%
url/legacy-url-parse.js e=1 type='long'                                 **      6.15 %       ±4.38% ±5.85% ±7.65%
url/legacy-url-parse.js e=1 type='percent'                             ***     62.52 %       ±0.73% ±0.98% ±1.28%
url/legacy-url-parse.js e=1 type='short'                               ***     49.30 %       ±2.15% ±2.89% ±3.83%
url/legacy-url-parse.js e=1 type='wpt'                                 ***     37.89 %       ±2.17% ±2.88% ±3.75%
url/legacy-url-parse.js e=1 type='ws'                                  ***     18.81 %       ±3.71% ±4.94% ±6.44%
url/url-parse.js n=10000000 type='escaped'                             ***     -5.09 %       ±1.19% ±1.59% ±2.10%
url/url-parse.js n=10000000 type='normal'                              ***    -10.54 %       ±2.54% ±3.38% ±4.40%
url/url-resolve.js n=100000 path='down' href='auth'                      *     -1.05 %       ±0.91% ±1.23% ±1.62%
url/url-resolve.js n=100000 path='down' href='dot'                     ***     -1.87 %       ±0.75% ±1.00% ±1.31%
url/url-resolve.js n=100000 path='down' href='file'                    ***      9.97 %       ±0.43% ±0.58% ±0.76%
url/url-resolve.js n=100000 path='down' href='idn'                     ***     -2.84 %       ±0.85% ±1.13% ±1.47%
url/url-resolve.js n=100000 path='down' href='javascript'              ***     -2.31 %       ±0.91% ±1.21% ±1.59%
url/url-resolve.js n=100000 path='down' href='long'                    ***     -0.92 %       ±0.30% ±0.39% ±0.51%
url/url-resolve.js n=100000 path='down' href='noscheme'                 **     -0.62 %       ±0.46% ±0.61% ±0.79%
url/url-resolve.js n=100000 path='down' href='percent'                 ***      9.52 %       ±0.42% ±0.56% ±0.73%
url/url-resolve.js n=100000 path='down' href='short'                   ***     -3.19 %       ±0.92% ±1.22% ±1.59%
url/url-resolve.js n=100000 path='down' href='ws'                      ***     -2.69 %       ±0.56% ±0.74% ±0.97%
url/url-resolve.js n=100000 path='foo/bar' href='auth'                 ***     -3.53 %       ±0.60% ±0.80% ±1.05%
url/url-resolve.js n=100000 path='foo/bar' href='dot'                  ***     -3.51 %       ±0.79% ±1.05% ±1.37%
url/url-resolve.js n=100000 path='foo/bar' href='file'                 ***      9.47 %       ±0.42% ±0.56% ±0.74%
url/url-resolve.js n=100000 path='foo/bar' href='idn'                  ***     -3.64 %       ±0.62% ±0.82% ±1.07%
url/url-resolve.js n=100000 path='foo/bar' href='javascript'           ***     -5.26 %       ±0.68% ±0.90% ±1.18%
url/url-resolve.js n=100000 path='foo/bar' href='long'                 ***      0.92 %       ±0.40% ±0.53% ±0.69%
url/url-resolve.js n=100000 path='foo/bar' href='noscheme'                      0.22 %       ±0.70% ±0.93% ±1.21%
url/url-resolve.js n=100000 path='foo/bar' href='percent'              ***      8.00 %       ±0.68% ±0.91% ±1.19%
url/url-resolve.js n=100000 path='foo/bar' href='short'                ***     -4.51 %       ±0.70% ±0.93% ±1.22%
url/url-resolve.js n=100000 path='foo/bar' href='ws'                   ***     -4.82 %       ±0.56% ±0.75% ±0.99%
url/url-resolve.js n=100000 path='sibling' href='auth'                 ***     -1.65 %       ±0.71% ±0.95% ±1.24%
url/url-resolve.js n=100000 path='sibling' href='dot'                   **     -1.03 %       ±0.75% ±1.00% ±1.32%
url/url-resolve.js n=100000 path='sibling' href='file'                 ***      9.37 %       ±0.39% ±0.52% ±0.68%
url/url-resolve.js n=100000 path='sibling' href='idn'                  ***     -3.25 %       ±0.74% ±0.99% ±1.29%
url/url-resolve.js n=100000 path='sibling' href='javascript'           ***     -1.72 %       ±0.62% ±0.82% ±1.08%
url/url-resolve.js n=100000 path='sibling' href='long'                 ***      1.77 %       ±0.38% ±0.50% ±0.66%
url/url-resolve.js n=100000 path='sibling' href='noscheme'                     -0.60 %       ±0.61% ±0.81% ±1.06%
url/url-resolve.js n=100000 path='sibling' href='percent'              ***      9.96 %       ±0.42% ±0.57% ±0.74%
url/url-resolve.js n=100000 path='sibling' href='short'                ***     -1.50 %       ±0.75% ±1.00% ±1.31%
url/url-resolve.js n=100000 path='sibling' href='ws'                   ***     -1.78 %       ±0.59% ±0.78% ±1.02%
url/url-resolve.js n=100000 path='up' href='auth'                      ***     -3.35 %       ±0.72% ±0.96% ±1.25%
url/url-resolve.js n=100000 path='up' href='dot'                       ***     -0.92 %       ±0.43% ±0.58% ±0.75%
url/url-resolve.js n=100000 path='up' href='file'                      ***      7.02 %       ±0.39% ±0.51% ±0.67%
url/url-resolve.js n=100000 path='up' href='idn'                       ***     -3.61 %       ±0.61% ±0.82% ±1.07%
url/url-resolve.js n=100000 path='up' href='javascript'                ***     -4.30 %       ±0.81% ±1.08% ±1.41%
url/url-resolve.js n=100000 path='up' href='long'                        *      0.51 %       ±0.47% ±0.63% ±0.81%
url/url-resolve.js n=100000 path='up' href='noscheme'                  ***     -1.54 %       ±0.51% ±0.69% ±0.90%
url/url-resolve.js n=100000 path='up' href='percent'                   ***      7.80 %       ±0.62% ±0.83% ±1.09%
url/url-resolve.js n=100000 path='up' href='short'                     ***     -1.99 %       ±0.64% ±0.86% ±1.12%
url/url-resolve.js n=100000 path='up' href='ws'                        ***     -1.65 %       ±0.56% ±0.75% ±0.98%
url/url-resolve.js n=100000 path='withscheme' href='auth'              ***     -4.74 %       ±0.42% ±0.56% ±0.73%
url/url-resolve.js n=100000 path='withscheme' href='dot'               ***     -6.83 %       ±1.11% ±1.48% ±1.92%
url/url-resolve.js n=100000 path='withscheme' href='file'              ***      5.38 %       ±0.59% ±0.79% ±1.03%
url/url-resolve.js n=100000 path='withscheme' href='idn'               ***     -4.73 %       ±0.59% ±0.79% ±1.03%
url/url-resolve.js n=100000 path='withscheme' href='javascript'        ***     -5.16 %       ±0.96% ±1.28% ±1.69%
url/url-resolve.js n=100000 path='withscheme' href='long'              ***     -3.61 %       ±0.63% ±0.84% ±1.10%
url/url-resolve.js n=100000 path='withscheme' href='noscheme'          ***     -5.83 %       ±0.45% ±0.59% ±0.77%
url/url-resolve.js n=100000 path='withscheme' href='percent'           ***      5.61 %       ±0.77% ±1.03% ±1.34%
url/url-resolve.js n=100000 path='withscheme' href='short'             ***     -6.64 %       ±0.55% ±0.73% ±0.95%
url/url-resolve.js n=100000 path='withscheme' href='ws'                ***     -6.92 %       ±0.50% ±0.67% ±0.87%
url/whatwg-url-parse.js e=1 type='auth' withBase='false'               ***      3.28 %       ±0.89% ±1.19% ±1.55%
url/whatwg-url-parse.js e=1 type='auth' withBase='true'                ***     83.91 %       ±1.14% ±1.53% ±2.01%
url/whatwg-url-parse.js e=1 type='dot' withBase='false'                ***     59.81 %       ±0.97% ±1.29% ±1.69%
url/whatwg-url-parse.js e=1 type='dot' withBase='true'                 ***    198.01 %       ±1.69% ±2.26% ±2.97%
url/whatwg-url-parse.js e=1 type='file' withBase='false'               ***     17.06 %       ±1.02% ±1.36% ±1.77%
url/whatwg-url-parse.js e=1 type='file' withBase='true'                ***    159.90 %       ±1.98% ±2.67% ±3.53%
url/whatwg-url-parse.js e=1 type='idn' withBase='false'                ***     28.46 %       ±0.97% ±1.30% ±1.71%
url/whatwg-url-parse.js e=1 type='idn' withBase='true'                 ***    134.64 %       ±1.25% ±1.68% ±2.20%
url/whatwg-url-parse.js e=1 type='javascript' withBase='false'         ***     16.76 %       ±0.93% ±1.23% ±1.61%
url/whatwg-url-parse.js e=1 type='javascript' withBase='true'          ***    169.94 %       ±1.98% ±2.66% ±3.51%
url/whatwg-url-parse.js e=1 type='long' withBase='false'               ***     70.69 %       ±1.08% ±1.44% ±1.88%
url/whatwg-url-parse.js e=1 type='long' withBase='true'                ***    114.66 %       ±1.62% ±2.18% ±2.89%
url/whatwg-url-parse.js e=1 type='percent' withBase='false'            ***     32.81 %       ±1.01% ±1.34% ±1.74%
url/whatwg-url-parse.js e=1 type='percent' withBase='true'             ***    151.85 %       ±1.53% ±2.04% ±2.67%
url/whatwg-url-parse.js e=1 type='short' withBase='false'              ***     59.16 %       ±1.59% ±2.12% ±2.77%
url/whatwg-url-parse.js e=1 type='short' withBase='true'               ***    202.12 %       ±1.99% ±2.68% ±3.54%
url/whatwg-url-parse.js e=1 type='wpt' withBase='false'                ***     23.16 %       ±1.15% ±1.54% ±2.01%
url/whatwg-url-parse.js e=1 type='wpt' withBase='true'                 ***    116.30 %       ±0.65% ±0.87% ±1.15%
url/whatwg-url-parse.js e=1 type='ws' withBase='false'                 ***     36.09 %       ±1.16% ±1.54% ±2.01%
url/whatwg-url-parse.js e=1 type='ws' withBase='true'                  ***    160.39 %       ±2.07% ±2.78% ±3.67%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-url-18-20.csv
                                                                confidence improvement accuracy (*)    (**)   (***)
url/legacy-url-parse.js e=1 type='auth'                                ***    -32.82 %       ±1.50%  ±2.00%  ±2.60%
url/legacy-url-parse.js e=1 type='dot'                                 ***    -28.57 %       ±2.09%  ±2.82%  ±3.74%
url/legacy-url-parse.js e=1 type='file'                                ***    -16.42 %       ±2.70%  ±3.59%  ±4.69%
url/legacy-url-parse.js e=1 type='idn'                                 ***    -28.80 %       ±0.82%  ±1.10%  ±1.43%
url/legacy-url-parse.js e=1 type='javascript'                                   0.84 %       ±2.67%  ±3.55%  ±4.63%
url/legacy-url-parse.js e=1 type='long'                                         0.16 %       ±6.07%  ±8.08% ±10.53%
url/legacy-url-parse.js e=1 type='percent'                             ***    -20.59 %       ±1.44%  ±1.93%  ±2.54%
url/legacy-url-parse.js e=1 type='short'                               ***    -23.42 %       ±2.54%  ±3.39%  ±4.45%
url/legacy-url-parse.js e=1 type='wpt'                                 ***     21.06 %       ±1.90%  ±2.53%  ±3.29%
url/legacy-url-parse.js e=1 type='ws'                                  ***    -15.00 %       ±3.59%  ±4.78%  ±6.22%
url/url-parse.js n=10000000 type='escaped'                             ***     -2.03 %       ±0.81%  ±1.08%  ±1.42%
url/url-parse.js n=10000000 type='normal'                              ***     -9.40 %       ±2.81%  ±3.78%  ±4.99%
url/url-resolve.js n=100000 path='down' href='auth'                     **      1.07 %       ±0.76%  ±1.02%  ±1.34%
url/url-resolve.js n=100000 path='down' href='dot'                              0.36 %       ±0.67%  ±0.89%  ±1.17%
url/url-resolve.js n=100000 path='down' href='file'                    ***      3.37 %       ±0.58%  ±0.78%  ±1.01%
url/url-resolve.js n=100000 path='down' href='idn'                     ***     -4.35 %       ±0.80%  ±1.06%  ±1.40%
url/url-resolve.js n=100000 path='down' href='javascript'              ***      5.98 %       ±0.69%  ±0.92%  ±1.20%
url/url-resolve.js n=100000 path='down' href='long'                    ***     -1.09 %       ±0.41%  ±0.55%  ±0.71%
url/url-resolve.js n=100000 path='down' href='noscheme'                ***      2.43 %       ±0.62%  ±0.82%  ±1.07%
url/url-resolve.js n=100000 path='down' href='percent'                 ***      1.28 %       ±0.55%  ±0.73%  ±0.95%
url/url-resolve.js n=100000 path='down' href='short'                            0.64 %       ±0.70%  ±0.93%  ±1.23%
url/url-resolve.js n=100000 path='down' href='ws'                       **      0.88 %       ±0.55%  ±0.73%  ±0.95%
url/url-resolve.js n=100000 path='foo/bar' href='auth'                 ***      2.08 %       ±0.58%  ±0.77%  ±1.01%
url/url-resolve.js n=100000 path='foo/bar' href='dot'                  ***      1.43 %       ±0.73%  ±0.98%  ±1.27%
url/url-resolve.js n=100000 path='foo/bar' href='file'                 ***      3.65 %       ±0.61%  ±0.82%  ±1.08%
url/url-resolve.js n=100000 path='foo/bar' href='idn'                  ***     -4.06 %       ±0.72%  ±0.96%  ±1.26%
url/url-resolve.js n=100000 path='foo/bar' href='javascript'           ***      6.88 %       ±1.31%  ±1.75%  ±2.29%
url/url-resolve.js n=100000 path='foo/bar' href='long'                 ***     -1.05 %       ±0.50%  ±0.67%  ±0.88%
url/url-resolve.js n=100000 path='foo/bar' href='noscheme'             ***      2.17 %       ±0.55%  ±0.73%  ±0.95%
url/url-resolve.js n=100000 path='foo/bar' href='percent'              ***      2.55 %       ±0.65%  ±0.87%  ±1.15%
url/url-resolve.js n=100000 path='foo/bar' href='short'                         0.58 %       ±1.10%  ±1.47%  ±1.91%
url/url-resolve.js n=100000 path='foo/bar' href='ws'                           -0.63 %       ±0.67%  ±0.89%  ±1.16%
url/url-resolve.js n=100000 path='sibling' href='auth'                 ***      1.05 %       ±0.57%  ±0.76%  ±1.00%
url/url-resolve.js n=100000 path='sibling' href='dot'                           0.53 %       ±0.61%  ±0.81%  ±1.06%
url/url-resolve.js n=100000 path='sibling' href='file'                         -0.08 %       ±0.58%  ±0.78%  ±1.03%
url/url-resolve.js n=100000 path='sibling' href='idn'                  ***     -3.88 %       ±0.71%  ±0.95%  ±1.25%
url/url-resolve.js n=100000 path='sibling' href='javascript'           ***      6.06 %       ±0.45%  ±0.59%  ±0.78%
url/url-resolve.js n=100000 path='sibling' href='long'                         -0.30 %       ±0.45%  ±0.60%  ±0.79%
url/url-resolve.js n=100000 path='sibling' href='noscheme'             ***      3.11 %       ±0.58%  ±0.77%  ±1.01%
url/url-resolve.js n=100000 path='sibling' href='percent'                *      0.69 %       ±0.53%  ±0.70%  ±0.92%
url/url-resolve.js n=100000 path='sibling' href='short'                ***      2.18 %       ±0.75%  ±1.00%  ±1.30%
url/url-resolve.js n=100000 path='sibling' href='ws'                            0.73 %       ±0.76%  ±1.01%  ±1.32%
url/url-resolve.js n=100000 path='up' href='auth'                      ***      1.21 %       ±0.66%  ±0.88%  ±1.14%
url/url-resolve.js n=100000 path='up' href='dot'                       ***      1.97 %       ±0.90%  ±1.20%  ±1.57%
url/url-resolve.js n=100000 path='up' href='file'                      ***      2.90 %       ±0.78%  ±1.05%  ±1.38%
url/url-resolve.js n=100000 path='up' href='idn'                       ***     -4.88 %       ±0.49%  ±0.65%  ±0.85%
url/url-resolve.js n=100000 path='up' href='javascript'                ***      4.93 %       ±0.54%  ±0.72%  ±0.94%
url/url-resolve.js n=100000 path='up' href='long'                      ***     -1.19 %       ±0.55%  ±0.73%  ±0.95%
url/url-resolve.js n=100000 path='up' href='noscheme'                  ***      2.82 %       ±0.87%  ±1.16%  ±1.52%
url/url-resolve.js n=100000 path='up' href='percent'                   ***      2.66 %       ±0.59%  ±0.80%  ±1.05%
url/url-resolve.js n=100000 path='up' href='short'                       *      0.79 %       ±0.77%  ±1.02%  ±1.33%
url/url-resolve.js n=100000 path='up' href='ws'                                -0.05 %       ±0.71%  ±0.94%  ±1.23%
url/url-resolve.js n=100000 path='withscheme' href='auth'              ***     -2.25 %       ±0.83%  ±1.10%  ±1.44%
url/url-resolve.js n=100000 path='withscheme' href='dot'               ***     -1.86 %       ±0.49%  ±0.65%  ±0.85%
url/url-resolve.js n=100000 path='withscheme' href='file'              ***     -1.61 %       ±0.67%  ±0.90%  ±1.17%
url/url-resolve.js n=100000 path='withscheme' href='idn'               ***     -3.43 %       ±0.52%  ±0.70%  ±0.91%
url/url-resolve.js n=100000 path='withscheme' href='javascript'                 0.10 %       ±0.65%  ±0.87%  ±1.13%
url/url-resolve.js n=100000 path='withscheme' href='long'                      -0.54 %       ±0.64%  ±0.85%  ±1.11%
url/url-resolve.js n=100000 path='withscheme' href='noscheme'          ***     -2.01 %       ±0.79%  ±1.06%  ±1.38%
url/url-resolve.js n=100000 path='withscheme' href='percent'                   -0.60 %       ±0.68%  ±0.91%  ±1.19%
url/url-resolve.js n=100000 path='withscheme' href='short'                     -0.62 %       ±0.93%  ±1.25%  ±1.63%
url/url-resolve.js n=100000 path='withscheme' href='ws'                 **     -1.43 %       ±0.83%  ±1.12%  ±1.47%
url/whatwg-url-parse.js e=1 type='auth' withBase='false'               ***    211.81 %       ±5.60%  ±7.54% ±10.00%
url/whatwg-url-parse.js e=1 type='auth' withBase='true'                ***    190.33 %       ±3.77%  ±5.07%  ±6.72%
url/whatwg-url-parse.js e=1 type='dot' withBase='false'                ***     73.08 %       ±2.28%  ±3.07%  ±4.05%
url/whatwg-url-parse.js e=1 type='dot' withBase='true'                 ***     66.32 %       ±2.46%  ±3.30%  ±4.34%
url/whatwg-url-parse.js e=1 type='file' withBase='false'               ***     83.29 %       ±2.75%  ±3.69%  ±4.88%
url/whatwg-url-parse.js e=1 type='file' withBase='true'                ***     69.38 %       ±2.50%  ±3.35%  ±4.42%
url/whatwg-url-parse.js e=1 type='idn' withBase='false'                ***     60.09 %       ±1.38%  ±1.85%  ±2.43%
url/whatwg-url-parse.js e=1 type='idn' withBase='true'                 ***     56.91 %       ±1.36%  ±1.82%  ±2.40%
url/whatwg-url-parse.js e=1 type='javascript' withBase='false'         ***     67.76 %       ±2.43%  ±3.26%  ±4.31%
url/whatwg-url-parse.js e=1 type='javascript' withBase='true'          ***     60.96 %       ±2.77%  ±3.72%  ±4.92%
url/whatwg-url-parse.js e=1 type='long' withBase='false'               ***    187.46 %       ±4.70%  ±6.33%  ±8.39%
url/whatwg-url-parse.js e=1 type='long' withBase='true'                ***    164.84 %       ±5.51%  ±7.41%  ±9.83%
url/whatwg-url-parse.js e=1 type='percent' withBase='false'            ***     84.65 %       ±2.77%  ±3.72%  ±4.92%
url/whatwg-url-parse.js e=1 type='percent' withBase='true'             ***     80.06 %       ±2.60%  ±3.49%  ±4.60%
url/whatwg-url-parse.js e=1 type='short' withBase='false'              ***     75.56 %       ±3.29%  ±4.42%  ±5.85%
url/whatwg-url-parse.js e=1 type='short' withBase='true'               ***     63.45 %       ±3.45%  ±4.64%  ±6.15%
url/whatwg-url-parse.js e=1 type='wpt' withBase='false'                ***    173.46 %       ±3.89%  ±5.23%  ±6.93%
url/whatwg-url-parse.js e=1 type='wpt' withBase='true'                 ***     99.49 %       ±7.79% ±10.49% ±13.92%
url/whatwg-url-parse.js e=1 type='ws' withBase='false'                 ***     95.77 %       ±3.05%  ±4.10%  ±5.42%
url/whatwg-url-parse.js e=1 type='ws' withBase='true'                  ***     85.66 %       ±2.66%  ±3.57%  ±4.71%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-url-16-20.csv
                                                                confidence improvement accuracy (*)    (**)   (***)
url/legacy-url-parse.js e=1 type='auth'                                ***    -16.25 %       ±1.59%  ±2.13%  ±2.82%
url/legacy-url-parse.js e=1 type='dot'                                   *      3.99 %       ±3.65%  ±4.86%  ±6.34%
url/legacy-url-parse.js e=1 type='file'                                ***     45.59 %       ±4.10%  ±5.49%  ±7.24%
url/legacy-url-parse.js e=1 type='idn'                                 ***     10.69 %       ±1.84%  ±2.45%  ±3.19%
url/legacy-url-parse.js e=1 type='javascript'                          ***     51.89 %       ±2.82%  ±3.77%  ±4.95%
url/legacy-url-parse.js e=1 type='long'                                 **      6.59 %       ±4.58%  ±6.12%  ±8.01%
url/legacy-url-parse.js e=1 type='percent'                             ***     28.80 %       ±2.27%  ±3.06%  ±4.05%
url/legacy-url-parse.js e=1 type='short'                               ***     13.32 %       ±2.61%  ±3.48%  ±4.53%
url/legacy-url-parse.js e=1 type='wpt'                                 ***     66.28 %       ±2.56%  ±3.41%  ±4.43%
url/legacy-url-parse.js e=1 type='ws'                                           1.75 %       ±4.01%  ±5.34%  ±6.96%
url/url-parse.js n=10000000 type='escaped'                             ***     -6.85 %       ±1.31%  ±1.75%  ±2.28%
url/url-parse.js n=10000000 type='normal'                              ***    -16.84 %       ±1.79%  ±2.39%  ±3.14%
url/url-resolve.js n=100000 path='down' href='auth'                            -0.38 %       ±1.11%  ±1.48%  ±1.93%
url/url-resolve.js n=100000 path='down' href='dot'                       *     -1.03 %       ±0.87%  ±1.16%  ±1.51%
url/url-resolve.js n=100000 path='down' href='file'                    ***     13.27 %       ±0.65%  ±0.86%  ±1.13%
url/url-resolve.js n=100000 path='down' href='idn'                     ***     -6.83 %       ±0.92%  ±1.23%  ±1.60%
url/url-resolve.js n=100000 path='down' href='javascript'              ***      3.79 %       ±0.97%  ±1.29%  ±1.69%
url/url-resolve.js n=100000 path='down' href='long'                    ***     -2.16 %       ±0.38%  ±0.51%  ±0.66%
url/url-resolve.js n=100000 path='down' href='noscheme'                ***      1.98 %       ±0.57%  ±0.77%  ±1.00%
url/url-resolve.js n=100000 path='down' href='percent'                 ***     10.94 %       ±0.56%  ±0.74%  ±0.97%
url/url-resolve.js n=100000 path='down' href='short'                   ***     -2.14 %       ±0.90%  ±1.19%  ±1.56%
url/url-resolve.js n=100000 path='down' href='ws'                      ***     -2.01 %       ±0.50%  ±0.67%  ±0.87%
url/url-resolve.js n=100000 path='foo/bar' href='auth'                 ***     -1.65 %       ±0.71%  ±0.94%  ±1.23%
url/url-resolve.js n=100000 path='foo/bar' href='dot'                  ***     -1.44 %       ±0.71%  ±0.94%  ±1.22%
url/url-resolve.js n=100000 path='foo/bar' href='file'                 ***     13.15 %       ±0.73%  ±0.98%  ±1.28%
url/url-resolve.js n=100000 path='foo/bar' href='idn'                  ***     -7.36 %       ±0.67%  ±0.89%  ±1.16%
url/url-resolve.js n=100000 path='foo/bar' href='javascript'                    0.12 %       ±0.77%  ±1.02%  ±1.33%
url/url-resolve.js n=100000 path='foo/bar' href='long'                          0.13 %       ±0.55%  ±0.73%  ±0.96%
url/url-resolve.js n=100000 path='foo/bar' href='noscheme'             ***      2.21 %       ±0.69%  ±0.92%  ±1.20%
url/url-resolve.js n=100000 path='foo/bar' href='percent'              ***     11.09 %       ±0.76%  ±1.02%  ±1.33%
url/url-resolve.js n=100000 path='foo/bar' href='short'                ***     -3.68 %       ±0.93%  ±1.25%  ±1.65%
url/url-resolve.js n=100000 path='foo/bar' href='ws'                   ***     -5.39 %       ±0.53%  ±0.70%  ±0.92%
url/url-resolve.js n=100000 path='sibling' href='auth'                         -0.42 %       ±0.63%  ±0.83%  ±1.09%
url/url-resolve.js n=100000 path='sibling' href='dot'                          -0.64 %       ±0.82%  ±1.10%  ±1.44%
url/url-resolve.js n=100000 path='sibling' href='file'                 ***      9.51 %       ±0.65%  ±0.87%  ±1.14%
url/url-resolve.js n=100000 path='sibling' href='idn'                  ***     -6.70 %       ±0.77%  ±1.03%  ±1.34%
url/url-resolve.js n=100000 path='sibling' href='javascript'           ***      3.81 %       ±0.66%  ±0.88%  ±1.15%
url/url-resolve.js n=100000 path='sibling' href='long'                 ***      1.62 %       ±0.47%  ±0.63%  ±0.82%
url/url-resolve.js n=100000 path='sibling' href='noscheme'             ***      2.18 %       ±0.56%  ±0.74%  ±0.96%
url/url-resolve.js n=100000 path='sibling' href='percent'              ***     10.93 %       ±0.55%  ±0.74%  ±0.97%
url/url-resolve.js n=100000 path='sibling' href='short'                         0.29 %       ±0.84%  ±1.11%  ±1.45%
url/url-resolve.js n=100000 path='sibling' href='ws'                    **     -1.00 %       ±0.58%  ±0.77%  ±1.01%
url/url-resolve.js n=100000 path='up' href='auth'                      ***     -2.15 %       ±0.62%  ±0.83%  ±1.08%
url/url-resolve.js n=100000 path='up' href='dot'                                0.60 %       ±0.64%  ±0.86%  ±1.12%
url/url-resolve.js n=100000 path='up' href='file'                      ***     10.31 %       ±0.83%  ±1.11%  ±1.47%
url/url-resolve.js n=100000 path='up' href='idn'                       ***     -7.80 %       ±0.42%  ±0.56%  ±0.73%
url/url-resolve.js n=100000 path='up' href='javascript'                         0.36 %       ±0.78%  ±1.04%  ±1.37%
url/url-resolve.js n=100000 path='up' href='long'                       **     -0.82 %       ±0.53%  ±0.70%  ±0.91%
url/url-resolve.js n=100000 path='up' href='noscheme'                    *      0.85 %       ±0.80%  ±1.06%  ±1.38%
url/url-resolve.js n=100000 path='up' href='percent'                   ***     10.85 %       ±0.80%  ±1.07%  ±1.39%
url/url-resolve.js n=100000 path='up' href='short'                      **     -0.94 %       ±0.70%  ±0.93%  ±1.21%
url/url-resolve.js n=100000 path='up' href='ws'                        ***     -2.03 %       ±0.63%  ±0.83%  ±1.09%
url/url-resolve.js n=100000 path='withscheme' href='auth'              ***     -6.73 %       ±0.75%  ±1.00%  ±1.32%
url/url-resolve.js n=100000 path='withscheme' href='dot'               ***     -7.92 %       ±0.78%  ±1.05%  ±1.37%
url/url-resolve.js n=100000 path='withscheme' href='file'              ***      3.19 %       ±0.71%  ±0.95%  ±1.24%
url/url-resolve.js n=100000 path='withscheme' href='idn'               ***     -7.95 %       ±0.54%  ±0.72%  ±0.94%
url/url-resolve.js n=100000 path='withscheme' href='javascript'        ***     -5.42 %       ±1.04%  ±1.39%  ±1.81%
url/url-resolve.js n=100000 path='withscheme' href='long'              ***     -3.66 %       ±0.61%  ±0.82%  ±1.07%
url/url-resolve.js n=100000 path='withscheme' href='noscheme'          ***     -7.68 %       ±0.74%  ±0.99%  ±1.30%
url/url-resolve.js n=100000 path='withscheme' href='percent'           ***      5.37 %       ±0.87%  ±1.15%  ±1.50%
url/url-resolve.js n=100000 path='withscheme' href='short'             ***     -7.53 %       ±0.87%  ±1.16%  ±1.52%
url/url-resolve.js n=100000 path='withscheme' href='ws'                ***     -8.38 %       ±0.82%  ±1.10%  ±1.44%
url/whatwg-url-parse.js e=1 type='auth' withBase='false'               ***    224.44 %       ±5.82%  ±7.84% ±10.40%
url/whatwg-url-parse.js e=1 type='auth' withBase='true'                ***    435.73 %       ±6.86%  ±9.25% ±12.28%
url/whatwg-url-parse.js e=1 type='dot' withBase='false'                ***    176.29 %       ±3.55%  ±4.78%  ±6.34%
url/whatwg-url-parse.js e=1 type='dot' withBase='true'                 ***    392.20 %       ±6.95%  ±9.37% ±12.43%
url/whatwg-url-parse.js e=1 type='file' withBase='false'               ***    114.63 %       ±3.19%  ±4.28%  ±5.66%
url/whatwg-url-parse.js e=1 type='file' withBase='true'                ***    340.17 %       ±6.19%  ±8.35% ±11.08%
url/whatwg-url-parse.js e=1 type='idn' withBase='false'                ***    106.46 %       ±1.70%  ±2.28%  ±3.02%
url/whatwg-url-parse.js e=1 type='idn' withBase='true'                 ***    269.01 %       ±3.03%  ±4.07%  ±5.39%
url/whatwg-url-parse.js e=1 type='javascript' withBase='false'         ***     95.46 %       ±2.84%  ±3.81%  ±5.03%
url/whatwg-url-parse.js e=1 type='javascript' withBase='true'          ***    335.50 %       ±7.27%  ±9.80% ±13.01%
url/whatwg-url-parse.js e=1 type='long' withBase='false'               ***    389.14 %       ±7.95% ±10.71% ±14.22%
url/whatwg-url-parse.js e=1 type='long' withBase='true'                ***    470.69 %      ±11.80% ±15.91% ±21.12%
url/whatwg-url-parse.js e=1 type='percent' withBase='false'            ***    144.13 %       ±3.64%  ±4.89%  ±6.48%
url/whatwg-url-parse.js e=1 type='percent' withBase='true'             ***    351.80 %       ±6.33%  ±8.53% ±11.32%
url/whatwg-url-parse.js e=1 type='short' withBase='false'              ***    180.01 %       ±5.17%  ±6.95%  ±9.21%
url/whatwg-url-parse.js e=1 type='short' withBase='true'               ***    398.35 %      ±10.45% ±14.09% ±18.70%
url/whatwg-url-parse.js e=1 type='wpt' withBase='false'                ***    235.28 %       ±4.72%  ±6.36%  ±8.43%
url/whatwg-url-parse.js e=1 type='wpt' withBase='true'                 ***    328.92 %      ±16.72% ±22.53% ±29.91%
url/whatwg-url-parse.js e=1 type='ws' withBase='false'                 ***    166.36 %       ±4.11%  ±5.53%  ±7.32%
url/whatwg-url-parse.js e=1 type='ws' withBase='true'                  ***    384.47 %       ±6.67%  ±8.99% ±11.92%
```

### `buffers`

```console
rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-buffers-16
-18.csv
                                                                            confidence improvement accuracy (*)    (**)   (***)
buffers/buffer-base64-decode.js size=8388608 n=32                                  ***      0.30 %       ±0.17%  ±0.23%  ±0.30%
buffers/buffer-base64-encode.js n=32 len=67108864                                   **     -0.33 %       ±0.19%  ±0.25%  ±0.33%
buffers/buffer-compare.js n=1000000 size=16                                        ***     -2.76 %       ±0.94%  ±1.26%  ±1.64%
buffers/buffer-compare.js n=1000000 size=16386                                     ***     64.55 %       ±8.79% ±11.85% ±15.72%
buffers/buffer-compare.js n=1000000 size=4096                                      ***    123.94 %       ±3.53%  ±4.73%  ±6.23%
buffers/buffer-compare.js n=1000000 size=512                                       ***    187.61 %       ±1.92%  ±2.59%  ±3.42%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=16          ***    -75.09 %       ±0.21%  ±0.28%  ±0.37%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=4           ***    -66.81 %       ±0.39%  ±0.52%  ±0.69%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=16         ***    -73.79 %       ±0.19%  ±0.25%  ±0.33%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=4          ***    -66.91 %       ±0.31%  ±0.41%  ±0.54%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=16        ***    -26.79 %       ±1.10%  ±1.47%  ±1.93%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=4         ***    -38.99 %       ±0.92%  ±1.23%  ±1.61%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=16          ***    -66.06 %       ±0.21%  ±0.28%  ±0.37%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=4           ***    -57.72 %       ±0.33%  ±0.44%  ±0.57%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=16         ***    -64.88 %       ±0.20%  ±0.26%  ±0.34%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=4          ***    -56.53 %       ±0.31%  ±0.41%  ±0.53%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=16        ***    -15.52 %       ±1.27%  ±1.69%  ±2.19%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=4         ***    -27.89 %       ±0.79%  ±1.05%  ±1.37%
buffers/buffer-from.js n=800000 len=100 source='array'                                      0.03 %       ±0.37%  ±0.49%  ±0.63%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer-middle'                ***      2.24 %       ±0.64%  ±0.86%  ±1.13%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer'                       ***      3.49 %       ±0.36%  ±0.49%  ±0.63%
buffers/buffer-from.js n=800000 len=100 source='buffer'                            ***     -3.32 %       ±0.48%  ±0.63%  ±0.83%
buffers/buffer-from.js n=800000 len=100 source='object'                            ***      6.16 %       ±0.49%  ±0.65%  ±0.85%
buffers/buffer-from.js n=800000 len=100 source='string-base64'                     ***     28.98 %       ±0.70%  ±0.93%  ±1.22%
buffers/buffer-from.js n=800000 len=100 source='string-utf8'                       ***     23.81 %       ±0.52%  ±0.69%  ±0.90%
buffers/buffer-from.js n=800000 len=100 source='string'                            ***     24.53 %       ±0.61%  ±0.82%  ±1.07%
buffers/buffer-from.js n=800000 len=100 source='uint16array'                       ***    -14.00 %       ±0.38%  ±0.51%  ±0.66%
buffers/buffer-from.js n=800000 len=100 source='uint8array'                        ***     -3.40 %       ±0.49%  ±0.66%  ±0.86%
buffers/buffer-from.js n=800000 len=2048 source='array'                            ***      3.89 %       ±0.20%  ±0.27%  ±0.35%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer-middle'               ***      1.56 %       ±0.49%  ±0.65%  ±0.84%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer'                      ***      2.72 %       ±0.41%  ±0.54%  ±0.71%
buffers/buffer-from.js n=800000 len=2048 source='buffer'                                    0.55 %       ±0.98%  ±1.30%  ±1.69%
buffers/buffer-from.js n=800000 len=2048 source='object'                           ***      5.74 %       ±0.58%  ±0.78%  ±1.02%
buffers/buffer-from.js n=800000 len=2048 source='string-base64'                    ***      8.15 %       ±0.32%  ±0.43%  ±0.57%
buffers/buffer-from.js n=800000 len=2048 source='string-utf8'                      ***     21.65 %       ±0.56%  ±0.74%  ±0.96%
buffers/buffer-from.js n=800000 len=2048 source='string'                           ***     21.79 %       ±0.57%  ±0.76%  ±0.99%
buffers/buffer-from.js n=800000 len=2048 source='uint16array'                              -0.72 %       ±1.05%  ±1.40%  ±1.83%
buffers/buffer-from.js n=800000 len=2048 source='uint8array'                         *      1.51 %       ±1.15%  ±1.53%  ±2.00%
buffers/buffer-tojson.js len=0 n=10000                                             ***     11.36 %       ±2.56%  ±3.40%  ±4.43%
buffers/buffer-tojson.js len=256 n=10000                                           ***    -81.12 %       ±1.25%  ±1.69%  ±2.24%
buffers/buffer-tojson.js len=4096 n=10000                                          ***    -88.39 %       ±0.69%  ±0.93%  ±1.23%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-buffers-18-20.csv
                                                                            confidence improvement accuracy (*)   (**)   (***)
buffers/buffer-base64-decode.js size=8388608 n=32                                  ***      1.66 %       ±0.10% ±0.14%  ±0.18%
buffers/buffer-base64-encode.js n=32 len=67108864                                  ***     -0.44 %       ±0.17% ±0.23%  ±0.30%
buffers/buffer-compare.js n=1000000 size=16                                        ***     -3.14 %       ±0.82% ±1.09%  ±1.41%
buffers/buffer-compare.js n=1000000 size=16386                                     ***    -15.56 %       ±5.97% ±7.95% ±10.35%
buffers/buffer-compare.js n=1000000 size=4096                                              -2.63 %       ±3.09% ±4.11%  ±5.35%
buffers/buffer-compare.js n=1000000 size=512                                       ***     -6.15 %       ±1.28% ±1.71%  ±2.24%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=16          ***    300.67 %       ±0.71% ±0.95%  ±1.24%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=4           ***    212.56 %       ±4.81% ±6.47%  ±8.58%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=16         ***    287.63 %       ±2.47% ±3.32%  ±4.40%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=4          ***    216.54 %       ±1.24% ±1.66%  ±2.17%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=16        ***     38.44 %       ±1.04% ±1.38%  ±1.80%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=4         ***     91.52 %       ±3.26% ±4.38%  ±5.80%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=16          ***    192.63 %       ±0.56% ±0.74%  ±0.97%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=4           ***    157.80 %       ±1.52% ±2.02%  ±2.64%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=16         ***    188.71 %       ±2.33% ±3.12%  ±4.10%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=4          ***    151.18 %       ±1.13% ±1.50%  ±1.96%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=16        ***     20.83 %       ±1.29% ±1.72%  ±2.25%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=4         ***     59.13 %       ±3.18% ±4.28%  ±5.65%
buffers/buffer-from.js n=800000 len=100 source='array'                             ***      3.91 %       ±0.50% ±0.66%  ±0.87%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer-middle'                ***     11.94 %       ±0.65% ±0.86%  ±1.13%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer'                       ***     12.49 %       ±0.77% ±1.03%  ±1.36%
buffers/buffer-from.js n=800000 len=100 source='buffer'                            ***      7.46 %       ±1.21% ±1.62%  ±2.12%
buffers/buffer-from.js n=800000 len=100 source='object'                            ***     12.70 %       ±0.84% ±1.12%  ±1.47%
buffers/buffer-from.js n=800000 len=100 source='string-base64'                     ***      2.91 %       ±1.40% ±1.88%  ±2.46%
buffers/buffer-from.js n=800000 len=100 source='string-utf8'                       ***     12.97 %       ±0.77% ±1.02%  ±1.33%
buffers/buffer-from.js n=800000 len=100 source='string'                            ***     16.61 %       ±0.71% ±0.95%  ±1.25%
buffers/buffer-from.js n=800000 len=100 source='uint16array'                       ***      5.64 %       ±0.84% ±1.13%  ±1.48%
buffers/buffer-from.js n=800000 len=100 source='uint8array'                        ***      6.75 %       ±0.95% ±1.28%  ±1.68%
buffers/buffer-from.js n=800000 len=2048 source='array'                                     0.03 %       ±0.33% ±0.43%  ±0.56%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer-middle'               ***     11.73 %       ±0.55% ±0.74%  ±0.96%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer'                      ***     12.85 %       ±0.55% ±0.73%  ±0.96%
buffers/buffer-from.js n=800000 len=2048 source='buffer'                           ***      7.66 %       ±1.28% ±1.70%  ±2.21%
buffers/buffer-from.js n=800000 len=2048 source='object'                           ***     11.96 %       ±0.90% ±1.20%  ±1.57%
buffers/buffer-from.js n=800000 len=2048 source='string-base64'                    ***      4.10 %       ±0.46% ±0.61%  ±0.79%
buffers/buffer-from.js n=800000 len=2048 source='string-utf8'                      ***     -1.30 %       ±0.71% ±0.96%  ±1.27%
buffers/buffer-from.js n=800000 len=2048 source='string'                           ***     -2.23 %       ±0.93% ±1.25%  ±1.64%
buffers/buffer-from.js n=800000 len=2048 source='uint16array'                      ***      6.89 %       ±1.44% ±1.91%  ±2.49%
buffers/buffer-from.js n=800000 len=2048 source='uint8array'                       ***      7.74 %       ±1.36% ±1.81%  ±2.37%
buffers/buffer-tojson.js len=0 n=10000                                             ***    -11.63 %       ±2.34% ±3.11%  ±4.06%
buffers/buffer-tojson.js len=256 n=10000                                           ***    482.81 %       ±7.02% ±9.42% ±12.42%
buffers/buffer-tojson.js len=4096 n=10000                                          ***    763.34 %       ±5.22% ±7.04%  ±9.34%

rafaelgss@MacBook-Pro-de-Rafael nodejs-internal-benchmark % node-benchmark-compare compare-buffers-16-20.csv
                                                                            confidence improvement accuracy (*)   (**)   (***)
buffers/buffer-base64-decode.js size=8388608 n=32                                  ***      2.34 %       ±0.16% ±0.21%  ±0.28%
buffers/buffer-base64-encode.js n=32 len=67108864                                  ***     -0.40 %       ±0.19% ±0.25%  ±0.33%
buffers/buffer-compare.js n=1000000 size=16                                        ***     -5.65 %       ±0.95% ±1.26%  ±1.64%
buffers/buffer-compare.js n=1000000 size=16386                                     ***     46.34 %       ±6.78% ±9.13% ±12.12%
buffers/buffer-compare.js n=1000000 size=4096                                      ***    111.99 %       ±4.63% ±6.22%  ±8.22%
buffers/buffer-compare.js n=1000000 size=512                                       ***    171.05 %       ±3.44% ±4.63%  ±6.13%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=16                  -0.07 %       ±0.24% ±0.32%  ±0.42%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=1 pieces=4           ***      3.44 %       ±1.61% ±2.17%  ±2.87%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=16         ***      1.86 %       ±0.66% ±0.89%  ±1.18%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=16 pieces=4          ***      4.84 %       ±0.44% ±0.59%  ±0.77%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=16         **      1.52 %       ±1.10% ±1.47%  ±1.93%
buffers/buffer-concat.js n=800000 withTotalLength=0 pieceSize=256 pieces=4         ***     16.13 %       ±2.09% ±2.79%  ±3.67%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=16          ***     -0.50 %       ±0.19% ±0.25%  ±0.33%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=1 pieces=4           ***      8.80 %       ±0.58% ±0.78%  ±1.03%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=16                  0.70 %       ±0.77% ±1.04%  ±1.37%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=16 pieces=4          ***      9.41 %       ±0.44% ±0.59%  ±0.78%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=16         **      1.80 %       ±1.10% ±1.47%  ±1.92%
buffers/buffer-concat.js n=800000 withTotalLength=1 pieceSize=256 pieces=4         ***     14.88 %       ±2.31% ±3.10%  ±4.10%
buffers/buffer-from.js n=800000 len=100 source='array'                             ***      4.28 %       ±0.53% ±0.71%  ±0.93%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer-middle'                ***     14.35 %       ±0.81% ±1.07%  ±1.40%
buffers/buffer-from.js n=800000 len=100 source='arraybuffer'                       ***     16.63 %       ±0.81% ±1.09%  ±1.43%
buffers/buffer-from.js n=800000 len=100 source='buffer'                            ***      3.94 %       ±1.10% ±1.48%  ±1.96%
buffers/buffer-from.js n=800000 len=100 source='object'                            ***     19.32 %       ±0.87% ±1.16%  ±1.53%
buffers/buffer-from.js n=800000 len=100 source='string-base64'                     ***     33.59 %       ±1.72% ±2.31%  ±3.06%
buffers/buffer-from.js n=800000 len=100 source='string-utf8'                       ***     40.42 %       ±0.86% ±1.16%  ±1.52%
buffers/buffer-from.js n=800000 len=100 source='string'                            ***     44.74 %       ±0.82% ±1.09%  ±1.43%
buffers/buffer-from.js n=800000 len=100 source='uint16array'                       ***     -9.04 %       ±0.72% ±0.97%  ±1.28%
buffers/buffer-from.js n=800000 len=100 source='uint8array'                        ***      3.24 %       ±0.88% ±1.18%  ±1.55%
buffers/buffer-from.js n=800000 len=2048 source='array'                            ***      3.78 %       ±0.29% ±0.39%  ±0.51%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer-middle'               ***     13.56 %       ±0.59% ±0.78%  ±1.02%
buffers/buffer-from.js n=800000 len=2048 source='arraybuffer'                      ***     15.75 %       ±0.58% ±0.77%  ±1.01%
buffers/buffer-from.js n=800000 len=2048 source='buffer'                           ***      8.11 %       ±1.20% ±1.61%  ±2.09%
buffers/buffer-from.js n=800000 len=2048 source='object'                           ***     18.44 %       ±0.89% ±1.20%  ±1.58%
buffers/buffer-from.js n=800000 len=2048 source='string-base64'                    ***     12.51 %       ±0.44% ±0.59%  ±0.78%
buffers/buffer-from.js n=800000 len=2048 source='string-utf8'                      ***     20.03 %       ±0.93% ±1.24%  ±1.63%
buffers/buffer-from.js n=800000 len=2048 source='string'                           ***     18.97 %       ±1.11% ±1.49%  ±1.96%
buffers/buffer-from.js n=800000 len=2048 source='uint16array'                      ***      5.10 %       ±1.12% ±1.50%  ±1.96%
buffers/buffer-from.js n=800000 len=2048 source='uint8array'                       ***      9.05 %       ±1.48% ±1.97%  ±2.56%
buffers/buffer-tojson.js len=0 n=10000                                                     -1.08 %       ±2.73% ±3.63%  ±4.73%
buffers/buffer-tojson.js len=256 n=10000                                           ***      7.90 %       ±1.73% ±2.30%  ±2.99%
buffers/buffer-tojson.js len=4096 n=10000                                                   0.55 %       ±0.90% ±1.19%  ±1.55%
```

## Node.js Common Operations

3. Node.js Common Operations

* parseInt is now equal to `+`
* Property access after shape transition
* Property Getter Access
* Property Setter Access
* Super vs This

Repository: https://github.com/RafaelGSS/nodejs-bench-operations.git
Commit: [63775b22dba8573194f85ef198635032be04b387](https://github.com/RafaelGSS/nodejs-bench-operations/commit/63775b22dba8573194f85ef198635032be04b387)

*Action executed in the dedicated host

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
