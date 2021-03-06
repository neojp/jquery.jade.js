# jQuery.jade by Joan Piedra
# https://github.com/neojp/jquery.jade
# @tpl : string | element | jQuery object
# @locals : object

(($) ->

	jade = require('jade')
	
	$.fn.jade = (tpl = '', locals = {}) ->

		if !jade
			return

		if typeof tpl == 'object'
			if tpl instanceof jQuery
				tpl = tpl[0]

			# regexp borrowed from jQote - http://aefxx.com/jquery-plugins/jqote/
			tpl = tpl.innerHTML.replace(/\s*<!\[CDATA\[\s*|\s*\]\]>\s*/g, '')
			tpl = $.trim(tpl)
		
		fn = jade.compile(tpl, { debug: false, compileDebug: false })
		html = fn(locals)

		return this.html(html)

)(jQuery)