# Waypoint

A CoffeeScript URI router for use anywhere. The main aim of
waypoint is to decouple the URI parsing from any kind of
automatic dispatching.

For example Director is a JS router that works both client
side and server side. It listens in the browser for URI
changes and runs the route callbacks for any matching routes.
On node it can respond to a Request object.

For waypoint I didn't want to include this behaviour so that
you are free to use what ever you want. In the browser you
could use History.js. On the server you could use a completely
custom solution. It's up to you.

## In the browser

First you'll want to clone the git repository like so:

	git clone git://github.com/DrPheltRight/waypoint.git
	cd waypoint

You'll find the latest development version of Waypoint for the
browser in the `dist` directory. You can either use this or
build your own like so:

	cake build

If you wanted to build the master version you can simply
checkout that branch.

Now you can use the browser edition as shown in
`examples/browser`. It is AMD, CommonJS and global
compatible so include it how you wish.

## On the server

You can use NPM to install waypoint like so:

	npm install waypoint

This will install it into `node_modules` within your current
directory. *You probably wouldn't want to use waypoint
globally.*

Once you have waypoint installed you can require it like
normal:

``` js
var waypoint = require('waypoint'),
	router = new Waypoint.Router;

router.routeMap({
	'/' : function () {
		console.log('Index');
	},
	'/:name': function (name) {
		console.log('Hello', name);
	},
	'POST /process': function () {
		console.log('POST request');
	}
})

router.dispatch('/');
router.dispatch('/Bob');
router.dispatch('POST', '/process');
```

## Contributing

If you wish to hack on waypoint clone the development branch
and use `npm link` to ensure your working directory is
symlinked into node's include path.

## Author

Luke Morton a.k.a. DrPheltRight

## License

MIT