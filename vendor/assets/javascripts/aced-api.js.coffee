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
          $.error "Element isn't ace editor"
          return @ 

        editor = @.data('aced_editor')
        if options['theme']
          editor.setTheme "ace/theme/#{options['theme']}"
        if options['mode']
          editorMode = require("ace/mode/#{options['mode']}").Mode
          editor.getSession().setMode(new editorMode())  
        @
    }  

    $.fn.aced = (method) ->
      if methods[method]
        return methods[ method ].apply @, Array.prototype.slice.call( arguments, 1 )
      else if typeof method == 'object' or not method
        return methods.init.apply @, arguments
      else
        $.error 'No method error'

)(jQuery)