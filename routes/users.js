
const router = require('express').Router();
const pg = require('pg');
const path = require('path');
let User = require('../models/user.model');
require('dotenv').config();
const config = {
  user: process.env.user,
  password: process.env.password,
  port: process.env.portDB,
  database: process.env.database,
}


const pool = new pg.Pool(config);


router.route('/').get((req, res) => {
  User.find()
    .then(users => res.json(users))
    .catch(err => res.status(400).json('Error: ' + err));
});

router.route('/add').post((req, res) => {
  const username = req.body.username;
  const newUser = new User({ username });
  newUser.save()
    .then(() => res.json('User added!'))
    .catch(err => res.status(400).json('Error: ' + err));
});


router.route('/login').post((req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  pool.connect(function (err, client, done) {
    if (err) {
      console.log("Can not connect to the DB" + err);
    }
    if (email && password) {
      client.query(`SELECT * FROM users WHERE email = '${req.body.email}' AND password = '${req.body.password}'`, function (err, result) {
         done();
         
        if (err) {
          console.log(err);
          res.status(400).send(err);
        }
        // res.status(200).send(result.rows);
        if (result.rowCount > 0) {
          res.status(200).send('true');
        } else {
          res.send('Incorrect Username and/or Password!');
        }			
        res.end();
      })
    } else {
      res.send('Please enter Username and Password!');
      res.end();
    }
  })

});
module.exports = router;