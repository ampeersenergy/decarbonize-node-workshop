const { promiseHooks, serialize, getHeapStatistics } = require('node:v8');
const { co2 } = require('@tgwf/co2');

const co2Emission = new co2({ results: "segment" })

const getBytesOfObject = obj => serialize(obj).byteLength;

function settled(promise) {
  console.log('a promise resolved or rejected');
  const stat = getHeapStatistics()
  console.dir(stat, { depth: null })
  console.log(co2Emission.perByte(stat.external_memory, false));
}
const stopWatchingSettleds = promiseHooks.onSettled(settled);



async function test() {
  // const result = await fetch('https://google.de').then(_ => _.text());
  // console.log(co2Emission.perByte(getBytesOfObject(result), false));
  new Promise(r => r(true));
}
test()
