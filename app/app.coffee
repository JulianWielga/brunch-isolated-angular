'use strict'

angular = require 'angular'
config = require './config.json'

module.exports = angular.module 'App', [
	require 'ui-router'
]

.config [
	'$stateProvider', '$urlRouterProvider'
	($stateProvider, $urlRouterProvider) ->

		$urlRouterProvider.otherwise '/'

		$stateProvider.state 'app',
			url: '/'
			templateUrl: "#{config.host}/app.html"
]

.run ($rootScope) ->
	console.log angular.version.full
	$rootScope.test2 = 456

