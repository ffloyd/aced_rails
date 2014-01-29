# AcedRails [![Gem Version](https://badge.fury.io/rb/aced_rails.png)](http://badge.fury.io/rb/aced_rails) [![endorse](http://api.coderwall.com/ffloyd/endorsecount.png)](http://coderwall.com/ffloyd)

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

The config file allows you to change themes, modes, workers, and key-bindings. It is simple and well commented. Just read it.

The main feature - The Gem includes aced-rails.js and necessary ACE javascripts to the asset_pipe as they are setup in the config file.

Usage
-----

I suppose you already have configured aced.

Aced provides a helper 'include_tag' that should be used instantly after your javascript_include_tag(commonly found in the application layout file):

```haml
  = stylesheet_link_tag "application"
  = javascript_include_tag "application"
  = aced_tag
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

* with rails form_for helper:

```haml
  = form_for @article do |f|
    .field
      = f.label :title
      = f.text_field :title
    .field
      = f.label :body
      = f.text_area :body,{"ace-editor" => "", "ace-mode" => "text", "ace-theme" => "github", style: "height: 300px;"}
    .actions
      = f.submit :save, class: "button"
```

Production environment
----------------------

To precompile all the libraries required for this gem to work on production environments, add the following to your production environment file.

```ruby
  # app/initializers/production.rb

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w(
    ace/ace.js
    ace/*
    aced-rails.js
  )
```

Also works for heroku too.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
