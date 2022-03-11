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
let newVal = true;

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/' + 'buzz.html');
});

app.get('/update', async (req, res) => {
  if (req.body.data == 'true' || req.body.data == 'false') {
    connected = req.body.data;
    newVal = true;
    res.send(connected);
  } else {
    res.send('Request not recognised');
  }
});

app.post('/state', (req, res) => {
  res.send(connected);
});

const isItDoneYet = new Promise((resolve, reject) => {
  if (newVal) {
    resolve(connected);
  } else {
    const why = 'Still working on something else';
    reject(why);
  }
});

app.post('/statePromise', async (req, res) => {
  isItDoneYet
    .then((ok) => {
      newVal = false;
      console.log('New value:', connected);
      res.send(connected);
    })
    .catch((err) => {
      console.error(err);
    });
});

//  app.post('/statePromise', async (req, res) => {
//   const isItDoneYet = new Promise((resolve, reject) => {
//     if (newVal) {
//       newVal = false;

//     console.log("New value:",connected);
//       resolve(connected);
//     } else {
//       const why = 'Still working on something else'
//       reject(why)
//     }
//   })
//      }

// Start server
const httpServer = http.createServer(app);
// const httpsServer = https.createServer(credentials, app);
httpServer.listen(PORT);
// httpsServer.listen(4000);
console.log('http available at: http://127.0.0.1:' + PORT);
// console.log('https available at: https://127.0.0.1:' + PORT);
