const express = require('express')
const app = express()
const port = 8000

app.get('/', (req, res) => {
  res.send('Hello')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app.get('/health', async(req, res) => {
  res.send('health checking');
});

