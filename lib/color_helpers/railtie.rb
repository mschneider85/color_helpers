require 'color_helpers/view_helpers'
module ColorHelpers
  class Railtie < Rails::Railtie
    initializer "color_helpers.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
