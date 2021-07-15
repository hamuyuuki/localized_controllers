# frozen_string_literal: true

require "test_helper"

class LocalizedControllersTest < ActionDispatch::IntegrationTest
  test "should not localize '/localizable_resources' endpoint" do
    get "/localizable_resources"

    assert_select "title", text: "Routed to LocalizableResourcesController"
    assert_select "body",
                  text: "Rendered to localizable_resources/index.html.erb"
  end

  test "should localize '/localizable_resources' endpoint to the en locale" do
    get "/en/localizable_resources"

    assert_select "title", text: "Routed to LocalizableResourcesEnController"
    assert_select "body",
                  text: "Rendered to localizable_resources/index.html.erb"
  end

  test "should localize '/localizable_resources' endpoint to the ja locale" do
    get "/ja/localizable_resources"

    assert_select "title", text: "Routed to LocalizableResourcesJaController"
    assert_select "body",
                  text: "Rendered to localizable_resources/index.ja.html.erb"
  end

  test "should not localize the controller when '/parent_namespace/localizable_resources' endpoint is requested" do
    get "/parent_namespace/localizable_resources"

    assert_select "title",
                  text:
                    "Routed to ParentNamespace::LocalizableResourcesController"
    assert_select "body",
                  text:
                    "Rendered to parent_namespace/localizable_resources/index.html.erb"
  end
end
