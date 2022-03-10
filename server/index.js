const express = require('express');
const app = express();
const fs = require('fs');
const http = require('http');
const https = require('https');
const morgan = require('morgan');
const bodyParser = require('body-parser');

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ 'extended': 'true' }));
app.use(bodyParser.json());
app.use(
  morgan(
    ':method :url Status::status Content-length::res[content-length] In::response-time ms',
  ),
);
app.use((req, res, next) => {
  // allow cross origin requests
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'POST, PUT, OPTIONS, DELETE, GET');
  res.header('Access-Control-Max-Age', '3600');
  res.header(
    'Access-Control-Allow-Headers',
    'Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With',
  );
  next();
});

const PORT = 3001;

let connected = false;

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/' + 'buzz.html');
});

app.get('/update', async (req, res) => {
  if (req.body.data == 'true' || req.body.data == 'false') {
    connected = req.body.data;
    res.send(connected);
  } else {
    res.send('Request not recognised');
  }
});

app.post('/state', (req, res) => {
  res.send(connected);
});

// Start server
const httpServer = http.createServer(app);
// const httpsServer = https.createServer(credentials, app);
httpServer.listen(PORT);
// httpsServer.listen(4000);
console.log('http available at: http://127.0.0.1:' + PORT);
// console.log('https available at: https://127.0.0.1:4000/');
