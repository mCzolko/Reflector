###*
	@author Michael Czolko <michael@czolko.cz>
###
class Reflector


	###*
		@construct
		@param {Object} object
	###	
	constructor: (@object) ->
		@methods = null
		@properties = null


	###*
		@return array
	###
	getProperties: ->
		@scan() if @properties == null
		@properties


	###*
		@return array
	###
	getMethods: ->
		@scan() if @methods == null
		@methods


	###*
		@return void
	###
	scan: ->
		@methods = new Array
		@properties = new Array
		for property of @object
			if typeof @object[property] == 'function'
				@methods.push property
			else
				@properties.push property
		return


	###*
		@param {Function} func
		@return array
	###
	getParamNames: (func) ->
		funcStr = func.toString()
		funcStr.slice(funcStr.indexOf('(')+1, funcStr.indexOf(')')).match(/([^\s,]+)/g)


	###*
		@param {Function} func
		@return int
	###
	getParamsCount: (func) ->
		@getParamNames().length


	###*
		@return {Function} func
	###
	getConstructor: ->
		@object.constructor