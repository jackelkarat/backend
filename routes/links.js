const router = require('express').Router();
let Link = require('../models/link.model');

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

router.route('/addURL').post((req, res) => {
  const userid = req.body.userid;
  const url = req.body.url;
  pool.connect(function (err, client, done) {
    if (err) {
    console.log(err);
  }
  if (url && userid) {
    client.query(`INSERT INTO links(link, userid) VALUES('${req.body.url}','${req.body.userid}')`, function (err, result) {
       done();
       
      if (err) {
        console.log(err);
        res.status(400).send(err);
      }else{
      res.status(200).send('true');		

      }
      res.end();
    })
  } else {
    res.status(500).send('Error!');
    res.end();
  }
})
});


router.route('/getlinks').post((req, res) => {
  const userid = req.body.userid;
  pool.connect(function (err, client, done) {
    if (err) {
    console.log(err);
  }
  if (userid) {
    client.query(`SELECT id,link FROM links WHERE userid = '${req.body.userid}'`, function (err, result) {
      done();
       
      if (err) {
        console.log(err);
        res.status(400).send(err);
      }else{
      res.status(200).send(result.rows);		

      }
      res.end();
    })
  } else {
    res.status(500).send('Error!');
    res.end();
  }
})
});
module.exports = router;