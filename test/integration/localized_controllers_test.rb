# frozen_string_literal: true

require "test_helper"

class LocalizedControllersTest < ActionDispatch::IntegrationTest
  test "should not localize '/localizable_resources' endpoint" do
    get "/localizable_resources"
    assert_equal "routed to LocalizableResourcesController",
                 response.parsed_body
  end

  test "should localize '/localizable_resources' endpoint to the en locale" do
    get "/en/localizable_resources"
    assert_equal "routed to LocalizableResourcesEnController",
                 response.parsed_body
  end

  test "should localize '/localizable_resources' endpoint to the ja locale" do
    get "/ja/localizable_resources"
    assert_equal "routed to LocalizableResourcesJaController",
                 response.parsed_body
  end
end
