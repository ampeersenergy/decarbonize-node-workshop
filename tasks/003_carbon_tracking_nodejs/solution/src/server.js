const fastify = require('fastify')({
  logger: true
});

const { co2 } = require('@tgwf/co2');
const co2Emission = new co2({ results: "segment" });

const globalStore = {
  'consumerDeviceCO2': 0,
  'networkCO2': 0,
  'productionCO2': 0,
  'dataCenterCO2 ': 0,
  total: 0,
};
const globalStoreAdder = (store, stateUpdate) => Object.entries(stateUpdate).reduce((acc, [key, value]) => {
  acc[key] = acc[key] + value;
  return acc;
}, store);

const co2Middleware = (request, reply) => {
  const requestCl = request.headers['content-length'] ?? 0;
  const replyCl = reply.getHeader('Content-Length');
  const emissionUpdate = co2Emission.perByte(requestCl + replyCl, true);
  globalStoreAdder(globalStore, emissionUpdate)
};

fastify.addHook('onResponse', co2Middleware);

fastify.get('/', (request, reply) => {
  return globalStore;
})
fastify.post('/', (request, reply) => {
  return globalStore;
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