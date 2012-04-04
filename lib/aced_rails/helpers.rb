module AcedRails
  module AcedHelpers
    def aced_tag
      result = ''
      AcedRails::Config.get_assets_files.each do |file|
        result += javascript_include_tag(file)
      end
      result.html_safe
    end
  end
end

ActionView::Base.send :include, AcedRails::AcedHelpers