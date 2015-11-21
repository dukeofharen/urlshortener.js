var express = require("express");
var app = express();
var router = require("./router");
var con = require("./constants");

app.use(express.bodyParser());
app.use(express.urlencoded());
app.use(express.json());

app.set('port', (process.env.PORT || 5000));

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});

router.route(app);