module Branding
  module Extension

    class << self
      def registered(app)
        app.helpers Helpers
      end
      alias :included :registered
    end

    module Helpers

      def profiles
        @profiles ||= []
      end

      def add_profile role, target, label
        profiles << { role: role, target: target, label: label }
      end

      def role_structure
        @sections ||= {}
      end

      def add_section title, provider_id, settings
        role_structure[title] ||= {}
        role_structure[title][provider_id] = settings
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

