module Branding
  module Sections

    class << self
      def registered(app)
        app.helpers Helpers
      end
      alias :included :registered
    end

    module Helpers

      def sections
        @sections ||= {}
      end

      def add_section title, partial
        sections[title] ||= []
        sections[title] << partial
      end

    end
  end
end

Middleman::Extensions.register :branding_sections, Branding::Sections


