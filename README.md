[![Build Status](https://travis-ci.com/hamuyuuki/localized_controllers.svg?branch=master)](https://travis-ci.com/hamuyuuki/localized_controllers)
[![Maintainability](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/maintainability)](https://codeclimate.com/github/hamuyuuki/localized_controllers/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/test_coverage)](https://codeclimate.com/github/hamuyuuki/localized_controllers/test_coverage)

# localized_controllers
`localized_controllers` brings _automagic_ localization to controllers. That's inspired by [Localized Views](https://guides.rubyonrails.org/i18n.html#localized-views) in Rails.

## Advance preparation
`localized_controllers` requires to resolve the locale in the rack layer. Please setup any one of them.

- [rack-contrib](https://github.com/rack/rack-contrib)
- [rack-user-locale](https://github.com/schinery/rack-user-locale)
- [rack-i18n_locale_switcher](https://github.com/christoph-buente/rack-i18n_locale_switcher)
- etc...

Or you set the locale to `env["rack.locale"]` in the rack layer.

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
For example, You have `/localizable_resources` and route it to `LocalizableResourcesController`.

```rb
Rails.application.routes.draw do
  get "localizable_resources", to: "localizable_resources#index"
end
```

```rb
class LocalizableResourcesController < ApplicationController
  def index
  end
end
```

If you'd like to localize `LocalizableResourcesController` to `en` locale, You can run `rails generate localized_controllers` command.

```sh
rails generate localized_controllers LocalizableResourcesController en
```

The generator will create `LocalizableResourcesEnController` as the `LocalizableResourcesController` for `en` locale.

```rb
class LocalizableResourcesEnController < ApplicationController
  def index
  end
end
```

By the way, The localized controller is enable to use the localized views.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/hamuyuuki/localized_controllers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
`localized_controllers` is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
