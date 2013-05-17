# I18n Dashboard 

[![Build Status](https://travis-ci.org/fourmach/i18n_dashboard.png?branch=master)](https://travis-ci.org/fourmach/i18n_dashboard)
[![Gem Version](https://badge.fury.io/rb/i18n_dashboard.png)](http://badge.fury.io/rb/i18n_dashboard)
[![Code Climate](https://codeclimate.com/github/fourmach/i18n_dashboard.png)](https://codeclimate.com/github/fourmach/i18n_dashboard)
[![Coverage Status](https://coveralls.io/repos/fourmach/i18n_dashboard/badge.png?branch=master)](https://coveralls.io/r/fourmach/i18n_dashboard?branch=master)


Rails Engine for I18n management with redis as backend.

## Screenshots

![#](https://raw.github.com/fourmach/i18n_dashboard/master/doc/screenshot-1.png)
![#](https://raw.github.com/fourmach/i18n_dashboard/master/doc/screenshot-2.png)


## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'i18n_dashboard'
```


And then execute:

    $ bundle

Modify your config/routes.rb and add:

``` ruby
mount I18nDashboard::Engine => '/i18n_dashboard'
```

Add to the bottom of config/environment.rb or in rake task.
``` ruby
I18nDashboard::Engine.load!
```


## Customize

Redis configuration:

``` ruby
I18nDashboard::Engine.redis = Redis.new
```

### Advanced

```ruby
I18nDashboard.configure do |config|
  config.layout = 'admin'
  config.inline_main_app_named_routes = true 
end
```

If change the layout you should keept in mind:

  * Add `//= require i18n_dashboard/application` to your javascript.
  * Specify the path to te partials `render 'application/admin_menu'` instead of `render 'admin_menu'`.
  * Add prefix `main_app` to the main app routes or set `inline_main_app_named_routes = true`.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
