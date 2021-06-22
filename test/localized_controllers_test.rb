# frozen_string_literal: true

require "test_helper"

module LocalizedControllers
  class Test < ActionDispatch::IntegrationTest
    test "should be localized to the default" do
      get "/localizable_resources"
      assert_equal "LocalizableResourcesController", response.parsed_body
    end

    test "should be localized to the en locale" do
      get "/localizable_resources?locale=en"
      assert_equal "LocalizableResourcesEnController", response.parsed_body
    end
  end
end
