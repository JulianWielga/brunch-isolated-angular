coffeeify = require 'coffeeify'

exports.config =
	files:
		stylesheets:
			joinTo:
				'app.css': /^(app|vendor|bower_components)/
		javascripts:
			joinTo:
				# This isn't needed when using Browserify.
				# 'app.js': /^app/
				'vendor.js': /^(vendor|bower_components)/

	# Again, browserify provides these.
	paths:
		watched: []
	npm:
		enabled: no
	modules:
		wrapper: no
		definition: no

	plugins:
		browserify:
			bundles:
				'app.js':
					entry: 'app/bootstrap.coffee'
					matcher: /^app/
			transforms: [
				coffeeify
			]

	notifications: ['log','info','warn','error','success']

	server:
		port: 4444
