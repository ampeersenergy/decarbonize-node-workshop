const fastify = require('fastify')({
    logger: true
  });
  
  fastify.get('/', (request, reply) => {
    return {};
  })
  fastify.post('/', (request, reply) => {
    return {};
  })
  
  /**
   * Run the server!
   */
  const start = async () => {
    try {
      await fastify.listen({ port: 3000 })
    } catch (err) {
      fastify.log.error(err)
      process.exit(1)
    }
  }
  start()