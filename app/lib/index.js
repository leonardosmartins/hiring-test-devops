const express = require('express')
const morgan = require('morgan')
const weather = require('weather-js')
const memoize = require('memoizee')

const { PORT = 8000 } = process.env
const getWeatherCached = memoize(getWeather, { promise: true, maxAge: 30 * 60 * 1000 })

express()
  .use(morgan('combined'))
  .get('/search', async (req, res) => {
    const { q: search = 'São Paulo, SP' } = req.query

    try {
      const response = await getWeatherCached(search)

      if (response) {
        res.send(response)
      } else {
        res.sendStatus(404)
      }
    } catch (err) {
      res.sendStatus(500)
    }
  })
  .listen(PORT, () => {
    console.info(`server started on port ${PORT}`)
  })

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
