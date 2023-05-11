const express = require('express')
const fs = require('node:fs')
const path = require('node:path')
const app = express()

app.get('/json', function (req, res) {
  res.send({ hello: 'world' })
})

app.get('/plain', function (req, res) {
  res.send('Hello world')
})

app.post('/body', function (req, res) {
  assert.ok(req.body.data0)
  assert.ok(req.body.data1)
  assert.ok(req.body.data2)
  assert.ok(req.body.data2.data20)
  res.send('Hello world')
})

app.get('/stream', function (req, res) {
  const stream = fs.createReadStream(path.join(__dirname, './large-file.json'), 'utf8')
  reply.setHeader('Content-Type', 'application/octet-stream')
  reply.send(stream)
})

app.listen(3000)
