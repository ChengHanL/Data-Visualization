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
person_id = "1";
id = "1";
nameValue = "1";
character = "1";
role = "1";

//create
client.query("INSERT INTO credits (person_id, id, name, character, role) VALUES ('" + person_id + "','" + id + "','" + nameValue + "','" + character + "','" + role + "')" , (err, res) =>{
    if(!err){
        console.log(res);
    }
    else{
        console.log(err.message);
    }
    client.end;
})

//read
client.query("SELECT release_year, runtime FROM titles" , (err, res) =>{
    if(!err){
        console.log(res);
    }
    else{
        console.log(err.message);
    }
    client.end;
})

//update

role = 'director';
nameValue2 = 'Robert De Niro';
client.query("UPDATE credits SET role = '" + role + "' FROM titles WHERE name ='" + nameValue2 + "'", (err, res) =>{
    if(!err){
        console.log(res);
    }
    else{
        console.log(err.message);
    }
    client.end;
})

//delete
nameValue3 = 'Albert Brooks';
client.query("DELETE FROM credits WHERE name ='" + nameValue3 + "'", (err, res) =>{
    if(!err){
        console.log(res);
    }
    else{
        console.log(err.message);
    }
    client.end;
})