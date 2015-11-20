	var logic = require('./logic');
	var route = function(app){
		app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});
		app.get('/add', function(request, response){
			var url = request.param('url');
			var vanity = request.param('vanity');
			logic.addUrl(url, request, response, vanity);
		});
		
		app.get('/whatis', function(request, response){
			var url = request.param('url');
			logic.whatIs(url, request, response);
		});

		app.get('/healthcheck', function(request, response){
			response.send("OK");
		});
		
		app.get('/:segment', function(request, response){
			logic.getUrl(request.params.segment, request, response);
		});
	}

	exports.route = route;