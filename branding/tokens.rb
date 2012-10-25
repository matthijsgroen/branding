module Branding
  module Tokens

    class << self
      def registered(app)
        app.helpers Helpers
      end
      alias :included :registered
    end

    module Helpers

      def tokens
        @tokens ||= []
      end

      def expose_token plugin, token
        tokens << { plugin: plugin, token: token }
      end
    end
  end
end

Middleman::Extensions.register :branding_tokens, Branding::Tokens



