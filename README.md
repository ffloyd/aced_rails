# AcedRails [![Gem Version](https://badge.fury.io/rb/aced_rails.png)](http://badge.fury.io/rb/aced_rails) [![Dependency Status](https://gemnasium.com/ffloyd/aced_rails.png)](https://gemnasium.com/ffloyd/aced_rails) [![Build Status](https://travis-ci.org/ffloyd/aced_rails.png)](https://travis-ci.org/ffloyd/aced_rails) [![endorse](http://api.coderwall.com/ffloyd/endorsecount.png)](http://coderwall.com/ffloyd)

Ace version is 1.0.0

[Demo app](http://aced-rails.herokuapp.com/) and [repo](https://github.com/ffloyd/aced_rails-test)

This gem provide some generators and helpers for using [Ajax.org Cloud9 Editor](http://ajaxorg.github.com/ace/) (ACE) in Rails applications.

I wrote a little jQuery plugin as part of this gem. Most important feature - is transform textarea into ace editor (hide textarea, place div instead and sync text). See below for more information.

Installation
------------

*Rails 3.2+ is required.*

Add this line to your application's Gemfile:

    gem 'aced_rails'

And then execute:

    $ bundle

And generate config file:

    $ rails g aced_rails:install

Configuration
-------------

Config file is simple one and well commented. Just read it.

The main feature - you select all necessary ACE's javascripts inside config file. Gem will add them and aced-rails.js in the pipeline.

Usage
-----

I suppose you already have configured aced.

Gem provides hepler, that should be used instantly after yours javascript_include_tags:

```ruby
  aced_tag
```

The most important feature is jQuery plugin:

* init example. Convert div to ACE editor with specified theme and mode

```javascript
  $(target_div).acedInit({theme: 'gihub', mode: 'javascript'});
```

* get ace editor object:

```javascript
  editor = $(aced_div).aced();
  // or
  editor = $(aced_div).data('ace-editor');
```

* get session

```javascript
  session = $(aced_div).acedSession();
  // or
  session = $(aced_div).aced().getSession();
```
* transform textarea to ace editor (hide textarea, create div and link it):

```javascript
  $(textarea).acedInitTA({theme: 'github', mode: 'javascript'});

  // get linked div
  $(textarea).data('ace-div') //return jQuery object
```

* without javasript:

```html
  <div ace-editor ace-theme="github" ace-mode="javascript"/>

  <textarea ace-editor ace-theme="github" ace-mode="javascript">
    alert('Hi!');
  </textarea>
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
