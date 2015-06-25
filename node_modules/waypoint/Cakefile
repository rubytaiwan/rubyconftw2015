fs = require 'fs'
{exec} = require 'child_process'
CoffeeScript = require 'coffee-script'
{parser, uglify} = require 'uglify-js'

lib = './lib'
tmp = './tmp'
dist = './dist'
eg = './examples'

version = JSON.parse(fs.readFileSync('./package.json')).version

header = """
  // Waypoint: Browser Edition v#{version}
  // Written by Luke Morton, MIT licensed.
  // https://github.com/DrPheltRight/waypoint
"""

task 'build', 'Create a browser edition of Waypoint', ->
  invoke 'clean'
  exec [
      "mkdir -p #{tmp}"
      "coffee -o #{tmp} #{lib}/waypoint/*.coffee"
    ].join(' && ')
  , ->
    code = ''
  
    for name in ['route', 'router']
        code += """
          require['./#{name}'] = new function () {
            var module = this;
            #{fs.readFileSync "#{tmp}/#{name}.js"}
          };

        """
      exec "rm -rf #{tmp}"
    
    code = """
      !function (definition) {
        if (typeof define === 'function' && define.amd) {
          define(definition);
        } else {
          this.Waypoint = definition();
        }
      }(function () {
        function require(path) {
          return require[path].exports;
        }

        #{code}

        return {
          'Route' : require('./route'),
          'Router': require('./router')
        };
      });
    """

    console.log "Building Waypoint #{version}"
    
    exec "mkdir -p #{dist}", ->
      fs.writeFileSync "#{dist}/waypoint-#{version}.js", header + '\n' + code
      fs.writeFileSync "#{eg}/browser/js/waypoint.js", header + '\n' + code

      code = uglify.gen_code uglify.ast_squeeze uglify.ast_mangle parser.parse code
      fs.writeFileSync "#{dist}/waypoint-#{version}.min.js", header + '\n' + code
      fs.writeFileSync "#{eg}/browser/js/waypoint.min.js", header + '\n' + code

task 'watch', 'Build on modification', ->
  waiting = false
  fs.watch "#{lib}/waypoint", (event, filename) ->
    return unless filename.indexOf('.coffee') > -1

    if waiting
      console.log('Waiting')
    else
      waiting = setTimeout((-> waiting = false), 2000)
      invoke('build')

task 'clean', 'Delete distribution folder', ->
  exec "rm -rf #{dist}"