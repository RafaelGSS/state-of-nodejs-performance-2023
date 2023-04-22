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
