module AcedRails
  module AcedHelpers
    def aced_tag
      result = ''
      result += javascript_include_tag('ace/ace.js')
      result += javascript_include_tag('aced-rails.js')
      result.html_safe
    end
  end
end