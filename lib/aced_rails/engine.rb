# encding: utf-8
module AcedRails
  class Engine < Rails::Engine
    initializer 'AcedRails.assets_pipeline' do |app|
      app.config.assets.precompile += AcedRails::Config.get_assets_files
    end
  end
end