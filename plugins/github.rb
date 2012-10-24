
module Github
  class << self
    def registered app
      app.after_configuration do
        add_link 'github', "https://github.com/#{data.me.github}", 'Github' if respond_to? :add_link
        add_section :developer, 'github' if respond_to? :add_section
      end
    end
  end
end

Middleman::Extensions.register :github, Github
