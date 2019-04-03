const { Pool, Client } = require('pg')

const pool = new Pool({
  user: 'postgres',
  host: '172.21.0.2',
  database: 'square',
  password: 'secret',
  port: 5432,
})




function sayHello(callback){
// callback
pool.query("SELECT * FROM hobby", (err, res) => {
  if (err) {
    console.log(err.stack)
  } else {
    callback(res.rows[0])
  }
})
}

module.exports = sayHello

/*
var mysql      = require('mysql');
var connection = mysql.createConnection({
   host     : '172.19.0.2',
  user     : 'root',
  password : 'root',
  database: 'jaco'
});

function sayHello(callback){
  connection.query('SELECT * from fields', function (error, results, fields) {
    if (error){
      console.log(error)
    }
    callback(results);
  })
}
module.exports = sayHello
*/
 

//    var mysql = require('promise-mysql');
// var connection;
 
// mysql.createConnection({
//   host     : '172.17.0.2',
//   user     : 'root',
//   password : 'jaco',
//   database: 'theSquare'
// }).then(function(conn){
//     connection = conn;
//     return connection.query('SELECT * from fields');
// }).then(function(rows){
//   console.log(rows);
// }).then(function(rows){
//     // Logs out a ring that Frodo owns
//     console.log(rows);
// });




 

   // connection.query('SELECT * from test', function (error, results, fields) {
   //    if (error){
   //       console.log(error)
   //    }
   //    console.log('The solution is: ', results[0]);
   // })



