module AcedRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "installs aced_rails gem initializer file (config/initializers/aced_rails.rb)"
      source_root File.expand_path('../templates', __FILE__)

      def copy_config
        copy_file 'aced_rails.rb', 'config/initializers/aced_rails.rb'
      end
    end
  end
end