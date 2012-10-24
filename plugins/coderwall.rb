
module Coderwall
  class << self
    def registered app
      app.after_configuration do
        add_link 'coderwall', "https://coderwall.com/#{data.me.coderwall}", 'My Coderwall' if respond_to? :add_link
        add_section :developer, 'coderwall' if respond_to? :add_section
      end
    end
  end
end

Middleman::Extensions.register :coderwall, Coderwall
