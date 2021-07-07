# frozen_string_literal: true

class LocalizedControllersGenerator < Rails::Generators::NamedBase
  argument :locale, type: :string
  argument :actions, type: :array, default: [], banner: "action action"

  source_root File.expand_path("templates", __dir__)

  def create_controller_file
    create_file "app/controllers/#{file_name}_#{locale}_controller.rb"
  end

  def create_view_files
    actions.each do |action|
      create_file "app/views/#{file_name}/#{action}.#{locale}.html.erb"
    end
  end
end
