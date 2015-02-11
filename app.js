var express = require("express");
var app = express();
var router = require("./router");
var con = require("./constants");

app.use(express.bodyParser());
app.use(express.urlencoded());
app.use(express.json());

app.listen(3500);
console.log("Started listening at port 3500");
router.route(app);