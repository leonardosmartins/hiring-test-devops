const weather = require('weather-js')
const memoize = require('memoizee')

const getWeatherCached = memoize(getWeather, { promise: true, maxAge: 30 * 60 * 1000 })

exports.handler = async (event, context, callback) => {
  try {
    const { q: search = 'São Paulo, SP' } = event
    const response = await getWeatherCached(search)
    
    if (response) {
      return (response)
    } else {
      console.error("Not Found - 404")
      return {statusCode: 404, body: 'Not found'}

    }
  } catch (err) {
    console.error("Server Internal Error - 500")
    return {statusCode: 500, body: 'Server Internal Error'}
  }
};

async function getWeather (search) {
  return new Promise((resolve, reject) => {
    weather.find({ search, degreeType: 'C' }, (err, result) => {
      if (err) {
        reject(err)
      } else if (!result || !result.length) {
        resolve(null)
      } else {
        resolve(result[0].current)
      }
    });
  })
}


