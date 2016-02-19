coffeeify = require 'coffeeify'

exports.config =
	files:
		stylesheets:
			joinTo:
				'app.css': /^app/
		javascripts:
			joinTo: {}
				# This isn't needed when using Browserify.
				# 'javascripts/app.js': /^app/
				#'vendor.js': /^(vendor|bower_components)/

	# Again, browserify provides these.
	modules:
		wrapper: no
		definition: no

	plugins:
		browserify:
			extensions: 'coffee'
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
