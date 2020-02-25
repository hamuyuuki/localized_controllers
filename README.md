[![Build Status](https://travis-ci.com/hamuyuuki/localized_controllers.svg?branch=master)](https://travis-ci.com/hamuyuuki/localized_controllers)
[![Maintainability](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/maintainability)](https://codeclimate.com/github/hamuyuuki/localized_controllers/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/22ce36bcfc386745e3b1/test_coverage)](https://codeclimate.com/github/hamuyuuki/localized_controllers/test_coverage)

# localized_controllers
Bring _automagic_ localization to controllers.

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

`app/controllers/localizable_resources_controller.rb`
```rb
class LocalizableResourcesController < ApplicationController
  def index
  end
end
```

`app/controllers/localizable_resources_en_controller.rb`
```rb
class LocalizableResourcesEnController < LocalizableResourcesController
  def index
  end
end
```

`app/controllers/localizable_resources/en_controller.rb`
```rb
class LocalizableResources::EnController < LocalizableResourcesController
  def index
  end
end
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/hamuyuuki/localized_controllers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
`localized_controllers` is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
