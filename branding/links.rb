module Branding
  module Links

    class << self
      def registered(app)
        app.helpers Helpers
      end
      alias :included :registered
    end

    module Helpers

      def links
        @links ||= []
      end

      def add_link role, target, label
        links << { role: role, target: target, label: label }
      end

    end
  end
end

Middleman::Extensions.register :branding_links, Branding::Links

