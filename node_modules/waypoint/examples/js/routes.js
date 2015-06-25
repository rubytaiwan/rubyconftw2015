var Waypoint = require('../../lib/waypoint');
var Router = Waypoint.Router;
var Route = Waypoint.Route;

var router = new Router({
	'routes' : [
		new Route('GET', '/home/:a', function (a) {
			console.log('root', a);
		})
	],
	'notFound' : function () {
		console.log('No route was matched');
	}
});

router.dispatch('/home/bob');
router.dispatch('/non-existent');