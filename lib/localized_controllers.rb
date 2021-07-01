# frozen_string_literal: true

require "active_support/lazy_load_hooks"

ActiveSupport.on_load(:before_initialize) do
  ActionDispatch::Request.prepend(LocalizedControllers)
  ActionController::Base.prepend(LocalizedControllers)
end

module LocalizedControllers
  def controller_class
    original_controller_class = super

    if path_parameters[:locale]
      controller_class_for("#{params[:controller]}_#{path_parameters[:locale]}")
    else
      original_controller_class
    end
  end

  def default_render(*args)
    if params["locale"]
      render(template: "#{params[:controller]}/#{params[:action]}")
    else
      super
    end
  end
end
