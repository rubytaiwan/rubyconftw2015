Waypoint = require('../../lib/waypoint')
router = new Waypoint.Router
  baseUri: '/'

# Use routeMap to generate and add routes to router
router.routeMap
  ''      : -> console.log('index')
  'about' : -> console.log('about')

  'products' :
    # Nested routes are sugar
    ''     : -> console.log('redirected to', '/products/all')
    '/all' : -> console.log('all products')
    '/:id' : (id) -> console.log('product: ', id)

  # Match a POST request for /contact
  'POST contact' : -> console.log('contact')

  # Multiple callbacks supported as array
  'logout' : [
    -> console.log('logging out')
    -> console.log('redirected to', '/')
  ]

router.dispatch('/')
router.dispatch('/products')
router.dispatch('/products/all')
router.dispatch('/products/100')
router.dispatch('/logout')