const express = require('express')
var request = require('request');

const app = express()
const port = 3000

app.get('/', (req, res) => {
  request({
  'url':'https://google.com',
  'method': "GET",
  'proxy':'34.134.202.216:3128'
},function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
      console.log(error)
  }
})
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})




