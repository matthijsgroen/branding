
module Coderwall
  class << self
    def registered app
      app.after_configuration do
        if respond_to? :add_section
          add_section :developer,
            'Coderwall',
            url: "https://coderwall.com/#{data.me.coderwall}"
        end
      end
    end
  end
end

Middleman::Extensions.register :coderwall, Coderwall
