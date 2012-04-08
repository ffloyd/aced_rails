AcedRails.configure do |config|

  # select ace variant = :normal or :noconflict
  config.type = :normal
  
  # select themes
  # available themes:
  # chrome, clouds, clouds_midnight, cobalt, crimson_editor, dawn, dreamweaver, eclipse,
  # idle_fingers, kr_theme, merbivore, merbivore_soft, mono_industrial, monokai,
  # pastel_on_dark, solarized_dark, solarized_light, textmate, tomorrow, tomorrow_night,
  # tomorrow_night_blue, tomorrow_night_bright, tomorrow_night_eighties, twilight, vibrant_ink 
  config.themes = [:twilight]

  # select modes
  # available modes:
  # c_cpp, clojure, coffee, coldfusion, csharp, css, groovy, haxe, html, java, javascript,
  # json, latex, lua, markdown, ocaml, perl, pgsql, php, powershell, python, ruby, scad,
  # scala, scss, sh, sql, svg, text, textile, xml, xquery
  config.modes = [:textile]
  
  #config.uncompressed_envs = ['development']
end