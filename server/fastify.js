const fastify = require('fastify')({
  logger: true
})

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

fastify.listen({ port: 3000 }, (err) => {
  if (err) throw err
})
