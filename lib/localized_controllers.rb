# frozen_string_literal: true

require "active_support/lazy_load_hooks"

ActiveSupport.on_load(:before_initialize) do
  require "action_dispatch/routing"

  ActionDispatch::Routing::RouteSet::Dispatcher.prepend(LocalizedControllers)
end

module LocalizedControllers
  def controller(req)
    super(req)

    case req.params["locale"]
    when "en"
      Class.new(LocalizableResourcesEnController)
    when "ja"
      Class.new(LocalizableResourcesJaController)
    else
      Class.new(LocalizableResourcesController)
    end
  end
end
