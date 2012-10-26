module Branding
  module Extension

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

      def sections
        @sections ||= {}
      end

      def add_section title, partial
        sections[title] ||= []
        sections[title] << partial
      end

      def tokens
        @tokens ||= []
      end

      def expose_token plugin, token
        tokens << { plugin: plugin, token: token }
      end

    end
  end
end

Middleman::Extensions.register :personal_branding, Branding::Extension

