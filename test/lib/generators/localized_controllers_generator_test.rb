require 'test_helper'
require 'generators/localized_controllers/localized_controllers_generator'

class LocalizedControllersGeneratorTest < Rails::Generators::TestCase
  tests LocalizedControllersGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
