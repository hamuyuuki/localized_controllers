# frozen_string_literal: true

require "test_helper"

class LocalizedControllersTest < ActionDispatch::IntegrationTest
  test "should not localize the controller when '/localizable_resources' endpoint is requested" do
    get "/localizable_resources"

    assert_select "title", text: "Routed to LocalizableResourcesController"
    assert_select "body",
                  text: "Rendered to localizable_resources/index.html.erb"
  end

  test "should localize the controller when '/en/localizable_resources' endpoint is requested" do
    get "/en/localizable_resources"

    assert_select "title", text: "Routed to LocalizableResourcesEnController"
    assert_select "body",
                  text: "Rendered to localizable_resources/index.html.erb"
  end

  test "should localize the controller and its view when '/ja/localizable_resources' endpoint is requested" do
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

  test "should localize the controller when '/en/parent_namespace/localizable_resources' endpoint is requested" do
    get "/en/parent_namespace/localizable_resources"

    assert_select "title",
                  text:
                    "Routed to ParentNamespace::LocalizableResourcesEnController"
    assert_select "body",
                  text:
                    "Rendered to parent_namespace/localizable_resources/index.html.erb"
  end

  test "should localize the controller and its view" \
         " when '/ja/parent_namespace/localizable_resources' endpoint is requested" do
    get "/ja/parent_namespace/localizable_resources"

    assert_select "title",
                  text:
                    "Routed to ParentNamespace::LocalizableResourcesJaController"
    assert_select "body",
                  text:
                    "Rendered to parent_namespace/localizable_resources/index.ja.html.erb"
  end
end
