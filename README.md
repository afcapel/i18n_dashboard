# I18n Dashboard 

[![Build Status](https://travis-ci.org/fourmach/i18n_dashboard.png?branch=master)](https://travis-ci.org/fourmach/i18n_dashboard)
[![Gem Version](https://badge.fury.io/rb/i18n_dashboard.png)](http://badge.fury.io/rb/i18n_dashboard)
[![Code Climate](https://codeclimate.com/github/fourmach/i18n_dashboard.png)](https://codeclimate.com/github/fourmach/i18n_dashboard)

Rails Engine for I18n management with redis as backend.

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

Add to the bottom of config/environment.rb
``` ruby
I18nDashboard::Engine.load!
```


## Customize

Redis configuration:

``` ruby
I18nDashboard::Engine.redis = Redis.new
```

Customize layout

``` ruby
I18nDashboard::TranslationsController.layout 'admin'
```
And add `//= require i18n_dashboard/application` to your javascript.


But beware, you may have to change somethings in your template like:

``` ruby
# partials
render 'admin_menu'

# change by for example
render 'application/admin_menu'

# or routes
admin_root_path
# add the prefix main_app
main_app.admin_root_path
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
