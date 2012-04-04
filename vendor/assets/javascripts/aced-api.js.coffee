(
  
  ($) ->
    $.fn.aced_init = (options) ->
      $.extend {
        id: 'aced_editor'
      }, options

      @.attr 'id', options['id']

      editor = ace.edit options['id']
      @.data 'aced_editor', editor

      delete options['id']
      @.aced_conf options

    $.fn.aced_conf = (options) ->
      return @ unless @.data('aced_editor')

      editor = @.data('aced_editor')
      if options['theme']
        editor.setTheme "ace/theme/#{options['theme']}"
      if options['mode']
        editorMode = require("ace/mode/#{options['mode']}").Mode
        editor.getSession().setMode(new editorMode())

)(jQuery)