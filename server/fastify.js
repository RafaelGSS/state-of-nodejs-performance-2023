const fastify = require('fastify')({
  logger: false
})
const fs = require('node:fs')
const path = require('node:path')

fastify.get('/', {
  schema: {
    response: {
      200: {
        hello: { type: 'string' }
      }
    }
  }
}, (_request, reply) => {
  reply.send({ hello: 'world' })
})

fastify.get('/plain', {
  schema: {
    response: {
      200: { type: 'string' },
    },
  },
}, (_request, reply) => {
  reply.header('Content-Type', 'text/plain');
  reply.send('Hello world')
})

fastify.post('/body', {
  schema: {
    body: {
      type: 'object',
      properties: {
        data0: { type: 'string' },
        data1: { type: 'number' },
        data2: {
          type: 'object',
          properties: {
            data20: { type: 'string' }
          }
        },
      },
      required: ['data0', 'data1', 'data2']
    },
  },
}, (request, reply) => {
  assert.ok(request.body.data0);
  assert.ok(request.body.data1);
  assert.ok(request.body.data2);
  assert.ok(request.body.data2.data20);
  reply.header('Content-Type', 'text/plain');
  reply.send('Hello world')
})

fastify.get('/stream', (request, reply) => {
  const stream = fs.createReadStream(path.join(__dirname, './large-file.json'), 'utf8')
  reply.header('Content-Type', 'application/octet-stream')
  reply.send(stream)
})

fastify.listen({ port: 3000 }, (err) => {
  if (err) throw err
})
