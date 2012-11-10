
module Github
  class << self
    def registered app
      app.after_configuration do
        if respond_to? :add_section
          add_section :developer,
            'Github',
            url: "https://github.com/#{data.me.github}"
        end
      end
    end
  end
end

Middleman::Extensions.register :github, Github
