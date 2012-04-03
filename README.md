AcedRails
=========

This gem provide some generators and helpers for using [Ajax.org Cloud9 Editor](http://ajaxorg.github.com/ace/) (ACE).

This's my first gem, so i'll be pleasure for any comments or pull requests.

My English is bad, i know. So, i glad to any grammar fixes too. =)

Installation
------------

Add this line to your application's Gemfile:

    gem 'aced_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aced_rails

Usage
-----

*Gem is under construction...*

At this moment this only gem provides all ACE's javascripts in vendor/javascripts/ace/*.js

So, you can add in application.js lines like this:

```javascript
//= require ace/ace
//= require ace/theme-twilight
//= require ace/mode-textile
```

And follow ACE's wiki for instructions.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
