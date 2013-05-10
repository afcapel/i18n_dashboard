# I18n Dashboard

Rails Engine for I18n management with redis as backend.

## Installation

Add this line to your application's Gemfile:

    gem 'i18n_dashboard'

And then execute:

    $ bundle

Modify your config/routes.rb and add:

``` ruby
mount I18nDashboard::Engine => '/i18n_dashboard'
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

But beware, you may have to change some things in your template like:

``` ruby
# partials
render 'admin_menu

# change by for example
render 'application/admin_menu

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