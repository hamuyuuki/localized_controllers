# frozen_string_literal: true

require "test_helper"

class LocalizedControllersTest < ActionDispatch::IntegrationTest
  test "should not localize '/localizable_resources' endpoint" do
  end

  test "should localize '/localizable_resources' to the en locale" do
  end

  test "should localize '/localizable_resources' to the ja locale" do
  end

  test "should be localized to the default" do
    get "/localizable_resources"
    assert_equal "LocalizableResourcesController", response.parsed_body
  end

  test "should be localized to the en locale" do
    get "/localizable_resources?locale=en"
    assert_equal "LocalizableResourcesEnController", response.parsed_body
  end
end
