# frozen_string_literal: true

require "test_helper"
require "generators/localized_controllers/localized_controllers_generator"

class LocalizedControllersGeneratorTest < Rails::Generators::TestCase
  tests LocalizedControllersGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  test "should create only the localized controller" do
    run_generator %w[LocalizableResources en]
    assert_file "app/controllers/localizable_resources_en_controller.rb"
    assert_no_file "app/views/localizable_resources/index.en.html.erb"
  end
end
