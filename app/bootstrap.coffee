'use strict'

config = require './config.json'

# save reference if angular loaded before
_angular = window.angular
window.angular = angular = {}

# load stylesheets
head = document.getElementsByTagName('head')[0]
link = document.createElement 'link'
link.rel = 'stylesheet'
link.type = 'text/css'
link.href = "#{config.host}/app.css"
link.media = 'all'
head.appendChild link

# create view
view = document.createElement 'ui-view'
wrapper = document.createElement 'div'
wrapper.setAttribute 'ng-non-bindable', ''
wrapper.appendChild view
rootElement = document.getElementById config.rootId
console.log rootElement.src
rootElement.parentNode.insertBefore wrapper, rootElement.nextSibling

# bootstrap isolated angular
angular = require 'angular'
angular.bootstrap view, [
	require('./app').name
]

# restore old angular reference
window.angular = _angular
