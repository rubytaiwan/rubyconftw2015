Route = require('./route')

isArray = Array.isArray
isArray or= ((obj) -> Object.prototype.toString.call(obj) is '[object Array]')    

class Router
  constructor: (config) ->
    if config
      for key in ['routes', 'baseUri', 'notFound', 'multi']
        @[key] = config[key] if config[key]?

      routeMap = config.routeMap if config.routeMap?
      
    @routes  or= []
    @baseUri or= ''
    @multi   or= no
    @routeMap(routeMap) if routeMap?

  route: (method, uri, callback) ->
    if typeof method is 'object'
      route = method
    else
      route = new Route(method, uri, callback)
    @routes.push(route)
    return @

  get : (uri, callback) -> @route('GET',  uri, callback)
  post: (uri, callback) -> @route('POST', uri, callback)

  extractUriAndMethod = (uri) ->
    matches = uri.match(/^(GET|POST) (.+)/)
    
    if matches and matches.length?
      [uri, method] = matches[1..2].reverse()
      method or= 'GET'
      return [uri, method]
    else
      return [uri or '', 'GET']
  
  routeMap: (map, baseUri = @baseUri) ->
    for uri, callback of map
      [uri, method] = extractUriAndMethod(uri)
      uri = baseUri+uri

      if typeof callback is 'function' or isArray(callback)
        @route(method, uri, callback)
      else if typeof callback is 'object'
        @routeMap(callback, uri)
      else
        throw 'Map must be string array or object'

    return @        

  dispatch: (method, uri, scope = {}) ->
    hasMatched = no

    for route in @routes
      continue unless matches = route.match(method, uri)

      hasMatched = yes

      if isArray(route.callback) 
        callbacks = route.callback
      else
        callbacks = [route.callback]

      c.apply(scope, matches) for c in callbacks
      
      break unless @multi

    @notFound.call(scope) if @notFound? and hasMatched is no
    return hasMatched

module.exports = Router