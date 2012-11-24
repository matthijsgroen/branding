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
        @profiles ||= PersonalProfiles.new(data.me).profiles
      end

      def role_structure
        @sections ||= PageSections.new(data.me).structure
      end

      def tokens
        @tokens ||= []
      end

      def expose_token plugin, token
        tokens << { plugin: plugin, token: token }
      end

    end
  end

  class PageSections
    attr_reader :structure

    def initialize(data)
      @structure = {}
      ::Branding::Plugins.each do |p|
        p.build_sections self, data if p.respond_to? :build_sections
      end
      @structure["photographer"] = {
        "hello" => {
          url: "stuff"
        }
      }
    end

    def add_section title, provider_id, settings
      @structure[title] ||= {}
      @structure[title][provider_id] = settings
    end
  end

  class PersonalProfiles
    attr_reader :profiles

    def initialize(data)
      @profiles = []
      ::Branding::Plugins.each do |p|
        p.build_profiles self, data if p.respond_to? :build_profiles
      end
    end

    def add_profile role, target, label
      @profiles << { role: role, target: target, label: label }
    end
  end


  class Plugins

    def self.add plugin
      @plugins ||= []
      @plugins << plugin
    end

    def self.each &block
      @plugins.each &block
    end

  end
end

Middleman::Extensions.register :personal_branding, Branding::Extension

