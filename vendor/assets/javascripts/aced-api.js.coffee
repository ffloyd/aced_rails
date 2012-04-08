(
  
  ($) ->
    methods = {
      init: (options) ->
        options = {} unless options

        unless options['id']
          if @.attr('id').length > 0
            options['id'] = @.attr 'id'
          else
            options['id'] = 'aced_editor'

        @.attr 'id', options['id']

        editor = ace.edit options['id']
        @.data 'aced_editor', editor

        delete options['id']
        @.aced 'conf', options
      ,
      conf: (options) ->
        unless @.data('aced_editor')
          return $.error "Element isn't ace editor"

        editor = @.data('aced_editor')
        session = editor.getSession()

        if options['theme']
          editor.setTheme "ace/theme/#{options['theme']}"
        
        if options['mode']
          editorMode = require("ace/mode/#{options['mode']}").Mode
          session.setMode(new editorMode())

        if options['content']
          session.setValue options['content']
        
        if options['on_change']
          if typeof options['on_change'] == 'function'
            session.on 'change', options['on_change']
          else
            $.error 'Argument must be a function'

        @
    }  

    $.fn.aced = (method) ->
      if methods[method]
        return methods[ method ].apply @, Array.prototype.slice.call( arguments, 1 )
      else if typeof method == 'object' or not method
        return methods.init.apply @, arguments
      else
        $.error 'No method error'

#----------------  aced_ta - textarea tag features  ---

    ta_methods = {
      init: (options) ->
        #check this (must be textarea)
        if not @.is('textarea')
          return $.error('Selected tag is not textarea')

        options == {} unless options

        #random id
        id_num = 1
        id_num = $.random(1000) while $("#aced_editor_#{id_num}").length > 0

        div = $('<div></div>')

        div.attr 'id', "aced_editor_#{id_num}"

        style = ''
        css = ''

        if options['class']
          css += " #{options['class']} "
          
        if options['style']
          style += " #{options['style']} "

        if options['normalize'] == 'yes'
          style += " position: relative; margin-left: 0; "

        if options['rows_to_px']
          height = parseInt(@.attr('rows')) * parseInt(options['rows_to_px'])
          style += " height: #{height}px; "
        
        div.attr 'class', css
        div.attr 'style', style

        @.before div
        @.hide()

        ta = $(@)
        callback = (event) ->
          ta.val div.data('aced_editor').getSession().getValue()

        div.aced 'init', $.extend(options, {on_change: callback})

        @.data 'aced_editor_div', div
        @.data 'aced_editor', div.data('aced_editor')
    }

    $.fn.aced_ta = (method) ->
      if ta_methods[method]
        return ta_methods[ method ].apply @, Array.prototype.slice.call( arguments, 1 )
      else if typeof method == 'object' or not method
        return ta_methods.init.apply @, arguments
      else
        $.error 'No method error'    

)(jQuery)