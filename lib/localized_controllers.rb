# frozen_string_literal: true

require "active_support/lazy_load_hooks"

ActiveSupport.on_load(:action_controller) do
  ActionDispatch::Request.prepend(
    Module.new do
      def controller_class
        original_controller_class = super

        if path_parameters[:locale]
          controller_class_for(
            "#{params[:controller]}_#{path_parameters[:locale]}"
          )
        else
          original_controller_class
        end
      end
    end
  )
  ActionController::Base.prepend(
    Module.new do
      def default_render(*args)
        if params["locale"]
          render(template: "#{params[:controller]}/#{params[:action]}")
        else
          super
        end
      end
    end
  )
end
