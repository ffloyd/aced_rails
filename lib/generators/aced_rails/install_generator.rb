module AcedRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "installs aced_rails gem initializer file (config/initializers/aced_rails.rb)"
      source_root File.expand_path('../templates', __FILE__)

      def copy_config
        copy_file 'aced_rails.rb', 'config/initializers/aced_rails.rb'
      end


      def add_js 
        js_manifest = 'app/assets/javascripts/application.js'

        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require aced-rails\n//= require ace/ace\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", js_manifest
        end
      end
    end
  end
end
