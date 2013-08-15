module AcedRails
  def self.configure
    yield Config
  end

  module Config
    mattr_accessor  :themes,
                    :keybindings,
                    :modes,
                    :exts,
                    :workers

    @@themes = @@keybindings = @@modes = @@exts = @@workers = []
    @@noconflict = false

    def self.get_assets_files
      result = []

      (@@themes + ['textmate']).each do |theme|
        result << "ace/theme-#{theme}.js"
      end

      @@keybindings.each do |keybinding|
        result << "ace/keybinding-#{keybinding}.js"
      end

      @@modes.each do |mode|
        result << "ace/mode-#{mode}.js"
      end

      @@exts.each do |mode|
        result << "ace/ext-#{mode}.js"
      end

      @@workers.each do |mode|
        result << "ace/worker-#{mode}.js"
      end

      result
    end

  end
end
