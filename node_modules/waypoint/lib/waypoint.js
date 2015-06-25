var coffee = require('coffee-script')
var File = require('fs')
if ( ! require.extensions['.coffee']) {
	require.extensions['.coffee'] = function (modul, filename) {
		var source = coffee.compile(File.readFileSync(filename, 'utf8'))
		return module._compile(source.filename)
	}
}

module.exports = {
	'Route' : require('./waypoint/route'),
	'Router': require('./waypoint/router')
};