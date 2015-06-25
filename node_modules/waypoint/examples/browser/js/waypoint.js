// Waypoint: Browser Edition v0.2.8
// Written by Luke Morton, MIT licensed.
// https://github.com/DrPheltRight/waypoint
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

  require['./route'] = new function () {
  var module = this;
  (function() {
  var Route;

  Route = (function() {
    var paramifyString, regifyString;

    function Route(method, uri, callback) {
      if (uri instanceof RegExp) {
        this.regex = uri;
      } else {
        this.regex = regifyString(uri, {});
      }
      this.method = method.toUpperCase();
      if (callback != null) this.callback = callback;
    }

    paramifyString = function(str, params, mod) {
      var param, _i, _len;
      mod = str;
      for (_i = 0, _len = params.length; _i < _len; _i++) {
        param = params[_i];
        if (params.hasOwnProperty(param)) {
          mod = params[param](str);
          if (mod !== str) break;
        }
      }
      if (mod === str) {
        return '([a-zA-Z0-9-]+)';
      } else {
        return mod;
      }
    };

    regifyString = function(str, params) {
      var capture, captures, _i, _len;
      if (str.indexOf('*') !== -1) {
        str = str.replace(/\*/g, '([_\.\(\)!\\ %@&a-zA-Z0-9-]+)');
      }
      if (captures = str.match(/:([^\/]+)/ig)) {
        for (_i = 0, _len = captures.length; _i < _len; _i++) {
          capture = captures[_i];
          str = str.replace(capture, paramifyString(capture, params));
        }
      }
      return new RegExp("^" + str + "$");
    };

    Route.prototype.match = function(method, uri) {
      var matches;
      if (uri == null) {
        uri = method;
        method = null;
      }
      if ((method != null) && this.method !== method.toUpperCase()) return false;
      matches = this.regex.exec(uri);
      if (matches && (matches.length != null)) return matches.slice(1);
      return false;
    };

    return Route;

  })();

  module.exports = Route;

}).call(this);

};
require['./router'] = new function () {
  var module = this;
  (function() {
  var Route, Router, isArray;

  Route = require('./route');

  isArray = Array.isArray;

  isArray || (isArray = (function(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
  }));

  Router = (function() {
    var extractUriAndMethod;

    function Router(config) {
      var key, routeMap, _i, _len, _ref;
      if (config) {
        _ref = ['routes', 'baseUri', 'notFound', 'multi'];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          key = _ref[_i];
          if (config[key] != null) this[key] = config[key];
        }
        if (config.routeMap != null) routeMap = config.routeMap;
      }
      this.routes || (this.routes = []);
      this.baseUri || (this.baseUri = '');
      this.multi || (this.multi = false);
      if (routeMap != null) this.routeMap(routeMap);
    }

    Router.prototype.route = function(method, uri, callback) {
      var route;
      if (typeof method === 'object') {
        route = method;
      } else {
        route = new Route(method, uri, callback);
      }
      this.routes.push(route);
      return this;
    };

    Router.prototype.get = function(uri, callback) {
      return this.route('GET', uri, callback);
    };

    Router.prototype.post = function(uri, callback) {
      return this.route('POST', uri, callback);
    };

    extractUriAndMethod = function(uri) {
      var matches, method, _ref;
      matches = uri.match(/^(GET|POST) (.+)/);
      if (matches && (matches.length != null)) {
        _ref = matches.slice(1, 3).reverse(), uri = _ref[0], method = _ref[1];
        method || (method = 'GET');
        return [uri, method];
      } else {
        return [uri || '', 'GET'];
      }
    };

    Router.prototype.routeMap = function(map, baseUri) {
      var callback, method, uri, _ref;
      if (baseUri == null) baseUri = this.baseUri;
      for (uri in map) {
        callback = map[uri];
        _ref = extractUriAndMethod(uri), uri = _ref[0], method = _ref[1];
        uri = baseUri + uri;
        if (typeof callback === 'function' || isArray(callback)) {
          this.route(method, uri, callback);
        } else if (typeof callback === 'object') {
          this.routeMap(callback, uri);
        } else {
          throw 'Map must be string array or object';
        }
      }
      return this;
    };

    Router.prototype.dispatch = function(method, uri, scope) {
      var c, callbacks, hasMatched, matches, route, _i, _j, _len, _len2, _ref;
      if (scope == null) scope = {};
      hasMatched = false;
      _ref = this.routes;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        route = _ref[_i];
        if (!(matches = route.match(method, uri))) continue;
        hasMatched = true;
        if (isArray(route.callback)) {
          callbacks = route.callback;
        } else {
          callbacks = [route.callback];
        }
        for (_j = 0, _len2 = callbacks.length; _j < _len2; _j++) {
          c = callbacks[_j];
          c.apply(scope, matches);
        }
        if (!this.multi) break;
      }
      if ((this.notFound != null) && hasMatched === false) {
        this.notFound.call(scope);
      }
      return hasMatched;
    };

    return Router;

  })();

  module.exports = Router;

}).call(this);

};


  return {
    'Route' : require('./route'),
    'Router': require('./router'),
  };
});