# frozen_string_literal: true

require "test_helper"
require "generators/localized_controllers/localized_controllers_generator"

class LocalizedControllersGeneratorTest < Rails::Generators::TestCase
  tests LocalizedControllersGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  test "should generate only the localized controller when the action is not specified" do
    run_generator %w[LocalizableResources en]
    assert_file "app/controllers/localizable_resources_en_controller.rb"
    assert_no_file "app/views/localizable_resources/index.en.html.erb"
  end

  test "should generate the localized controller and its view when the action is specified" do
    run_generator %w[LocalizableResources en index]
    assert_file "app/controllers/localizable_resources_en_controller.rb"
    assert_file "app/views/localizable_resources/index.en.html.erb"
  end

  test "should generate the localized controller and its views when actions is specified" do
    run_generator %w[LocalizableResources en index show]
    assert_file "app/controllers/localizable_resources_en_controller.rb"
    assert_file "app/views/localizable_resources/index.en.html.erb"
    assert_file "app/views/localizable_resources/show.en.html.erb"
  end
end
