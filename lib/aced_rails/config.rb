module AcedRails
  def self.configure
    yield Config
  end

  module Config
    mattr_accessor :themes, :keybindings, :modes, :type
    @@themes = @@keybindings = @@modes = []
    @@type = :normal

    def self.get_assets_files
      suffix = ''
      if @@type == :noconflict
        suffix = '-noconflict'
      end

      result = ["aced-api.js" ,"ace/ace#{suffix}.js"]

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