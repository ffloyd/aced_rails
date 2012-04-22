module AcedRails
  def self.configure
    yield Config
  end

  module Config
    mattr_accessor  :themes,
                    :keybindings,
                    :modes,
                    :type,
                    :uncompressed_envs

    @@themes = @@keybindings = @@modes = []
    @@type = :normal
    @@uncompressed_envs = ['development']

    def self.get_assets_files
      suffix = ''
      if @@type == :noconflict
        suffix = '-noconflict'
      end

      if @@uncompressed_envs.include?(Rails.env)
        suffix += '-uncompressed'
      end

      result = ["aced-api.js", "jquery.random.js", "ace/ace#{suffix}.js"]

      @@themes.each do |theme|
        result << "ace/theme-#{theme}#{suffix}.js"
      end
      @@keybindings.each do |keybinding|
        result << "ace/keybinding-#{keybinding}#{suffix}.js"
      end
      @@modes.each do |mode|
        result << "ace/mode-#{mode}#{suffix}.js"
      end

      result
    end
    
  end
end