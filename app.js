const express = require('express')
const app = express()
const port = 8000

app.get('/', (req, res) => {
  res.send('안녕')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app.get('/health', async(req, res) => {
  res.send('health checking');
});

