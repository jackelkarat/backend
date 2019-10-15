
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


router.route('/register').post((req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  const firstname = req.body.firstname;
  const lastname = req.body.lastname;

  pool.connect(function (err, client, done) {
    if (err) {
      console.log(err);
    }
    if (email && password && lastname && firstname) {
      client.query(`SELECT * FROM users WHERE email = '${req.body.email}'`, function (err, result) {
        done();
        if (err) {
          console.log(err);
          res.status(400).send(err);
        }
        if (result.rowCount == 0) {

          pool.connect(function (err, client, done) {
            client.query(`INSERT INTO users (firstname, lastname, email, password) VALUES('${req.body.firstname}','${req.body.lastname}','${req.body.email}','${req.body.password}')`, function (err, result) {
              done();
              if (err) {
                console.log(err);
                res.status(400).send(err);
              } else {
                res.status(200).send('success');

              }
              res.end();
            });
          })

        } else {
          res.json({ error: 'User Already Exist!' });
        }
      });
    } else {
      res.json({ error: 'Please check your fields!' });
      res.end();
    }
  })
});



router.route('/login').post((req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  pool.connect(function (err, client, done) {
    if (err) {
      console.log(err);
    }
    if (email && password) {
      client.query(`SELECT * FROM users WHERE email = '${req.body.email}' AND password = '${req.body.password}'`, function (err, result) {
        done();

        if (err) {
          console.log(err);
          res.status(400).send(err);
        }
        if (result.rowCount > 0) {
          res.status(200).send(result.rows);
        } else {
          res.json({ error: 'Incorrect Username and/or Password!' });
        }
        res.end();
      })
    } else {
      res.json({ error: 'Please enter Username and Password!' });
      res.end();
    }
  })
});
module.exports = router;