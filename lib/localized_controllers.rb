# frozen_string_literal: true

require "active_support/lazy_load_hooks"

ActiveSupport.on_load(:before_initialize) do
  require "action_dispatch/routing"

  ActionDispatch::Routing::RouteSet::Dispatcher.prepend(LocalizedControllers)
end

module LocalizedControllers
  def controller(req)
    super(req)

    if req.params["locale"] == "en"
      return Class.new(LocalizableResourcesEnController)
    end
    Class.new(LocalizableResourcesController)
  end
end
