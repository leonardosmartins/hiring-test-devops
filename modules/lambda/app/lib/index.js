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
      console.log("404")
    }
  } catch (err) {
    console.log("500")
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


