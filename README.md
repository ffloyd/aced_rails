AcedRails
=========

This gem provide some generators and helpers for using [Ajax.org Cloud9 Editor](http://ajaxorg.github.com/ace/) (ACE) in Rails applications.

I wrote a little jQuery plugin as part of this gem. It gives coll interface to control basic functions of ACE and integrate ACE into forms without bookmarklet magick and limitations (by default ACE doesn't support textarea).

This's my first gem, so i'll be pleasure for any comments or pull requests.

My English is bad (terrific, awful etc.), i know. So, i'll be glad to any grammar fixes too. =)

Installation
------------

*Rails 3.1+ is required.*

Add this line to your application's Gemfile:

    gem 'aced_rails'

And then execute:

    $ bundle

And generate config file:

    $ rails g aced_rails:install

Configuration
-------------

Config file is simple one and well commented. Just read it.

The main feature - you select all necessary ACE's javascripts inside config file. Gem will add them and aced-api.js in the pipeline.

Usage
-----

I suppose you already have configured aced.

Gem provides hepler, that should be used instantly after yours javascript_include_tags:

```ruby
  aced_tag
```

Pretty simple, isn't it? This helper requires all js from configuration.

The most important feature is jQuery plugin:

* init

```javascript
  $(target_div).aced('init', {theme: 'twilight', mode: 'textile'});
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
