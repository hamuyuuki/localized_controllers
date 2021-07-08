# frozen_string_literal: true

class LocalizedControllersGenerator < Rails::Generators::NamedBase
  argument :locale, type: :string
  argument :actions, type: :array, default: [], banner: "action action"

  source_root File.expand_path("templates", __dir__)

  def create_controller_file
    template "controller.rb",
             "app/controllers/#{file_name}_#{locale}_controller.rb"
  end

  def create_view_files
    actions.each do |action|
      @action = action
      template "view.html.erb",
               "app/views/#{file_name}/#{action}.#{locale}.html.erb"
    end
  end
end
