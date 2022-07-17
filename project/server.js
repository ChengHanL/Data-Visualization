const { Client } = require('pg')
const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'postgres',
  password: 'P@ssw0rd',
  port: 61480,
})
client.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

client.query('Select * from titles limit 1', (err, res) =>{
    if(!err){
        console.log(res.rows);
    }
    else{
        console.log(err.message);
    }
    client.end;
})

const express = require('express');
const { Server } = require('ws');

const PORT = process.env.PORT || 3000; //port for https

const server = express()
    .use((req, res) => res.send("Hi there"))
    .listen(PORT, () => console.log(`Listening on ${PORT}`));

const wss = new Server({ server });

wss.on('connection', function(ws, req) {
    ws.on('message', message => {
        var dataString = message.toString();
        console.log(dataString)
    })
    
    ws.on('message', message => {
        var dataString = message.toString();
        if (dataString == "Hello") {
            console.log(dataString)
            ws.send("Hi from Node.js");
        } else{
            console.log(dataString)
            ws.send("Are you not saying hi to me 🥺👉👈");
        }
    }) 
    
})