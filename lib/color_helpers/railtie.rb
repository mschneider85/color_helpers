module ColorHelpers
  class Railtie > ::Rails::Railtie
    initializer "color_helpers.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        include ColorHelpers::ActionView::Helpers
      end

      ActiveSupport.on_load :action_controller do
        include ColorHelpers::ActionController::Filters
      end
    end
  end
end
