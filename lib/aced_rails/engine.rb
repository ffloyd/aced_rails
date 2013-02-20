# encding: utf-8
require "aced_rails/helpers"

module AcedRails
  class Engine < Rails::Engine
    initializer 'AcedRails.assets_pipeline' do |app|
      app.config.assets.precompile += AcedRails::Config.get_assets_files
    end
    initializer 'AcedRails.view_helpers' do |app|
      ActionView::Base.send :include, AcedRails::AcedHelpers
    end
  end
end