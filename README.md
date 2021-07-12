[![Build Status](https://travis-ci.com/hamuyuuki/localized_controllers.svg?branch=main)](https://travis-ci.com/hamuyuuki/localized_controllers)
[![CI](https://github.com/hamuyuuki/localized_controllers/actions/workflows/ci.yml/badge.svg)](https://github.com/hamuyuuki/localized_controllers/actions/workflows/ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/maintainability)](https://codeclimate.com/github/hamuyuuki/localized_controllers/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/test_coverage)](https://codeclimate.com/github/hamuyuuki/localized_controllers/test_coverage)

# localized_controllers

`localized_controllers` brings _automagic_ localization to controllers. That's inspired by [Localized Views](https://guides.rubyonrails.org/i18n.html#localized-views) in Rails.

## Advance preparation

`localized_controllers` supports only _Setting the Locale from URL Params_ way to resolve the locale now. Please refer to https://guides.rubyonrails.org/i18n.html#setting-the-locale-from-url-params.

## Getting Started

Install `localized_controllers` at the command prompt:

```sh
gem install localized_controllers
```

Or add `localized_controllers` to your Gemfile:

```ruby
gem "localized_controllers"
```

## How to use

For example, You have `/(en|ja)/localizable_resources` endpoint and route it to `LocalizableResources#index`.

`config/routes.rb`:

```rb
Rails
  .application
  .routes
  .draw do
    scope "(:locale)", locale: /en|ja/ do
      get "localizable_resources", to: "localizable_resources#index"
    end
  end
```

`app/controllers/localizable_resources_controller.rb`:

```rb
class LocalizableResourcesController < ApplicationController
  def index; end
end
```

If you'd like to localize `LocalizableResources#index` to `en` locale, You can generate the controller and its views with `rails generate localized_controllers` command. Then you can serve with `LocalizableResourcesEn#index` when `/en/localizable_resources` endpoint is requested.

```sh
rails generate localized_controllers LocalizableResources en index
```

`app/controllers/localizable_resources_en_controller.rb`:

```rb
class LocalizableResourcesEnController < ApplicationController
  def index; end
end
```

`app/views/localizable_resources/index.en.html.erb`:

```html
This view is the LocalizableResources#index for the en locale.
```

For more information of `rails generate localized_controllers` command, please see the following:

```sh
$ rails generate localized_controllers
Usage:
  rails generate localized_controllers NAME LOCALE [action action] [options]

Options:
  [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Stubs out a new localized controller and its views. Pass the controller name,
    either CamelCased or under_scored, the locale name and a list of views as
    arguments.

    To create a localized controller within a module, specify the controller name
    as a path like 'parent_module/controller_name'.

    This generates a localized controller class in app/controllers and template
    engine.

Example:
    `rails generate localized_controllers LocalizableResources en index show`

    LocalizableResourcesEn controller with URLs like /localizable_resources.
        Controller: app/controllers/localizable_resources_en_controller.rb
        Views:      app/views/localizable_resources/index.en.html.erb [...]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hamuyuuki/localized_controllers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

`localized_controllers` is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
