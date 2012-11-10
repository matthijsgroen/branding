
module LinkedIn
  class << self
    def registered app
      app.after_configuration do
        add_profile 'linked_in', data.me.linked_in, 'LinkedIn' if respond_to? :add_profile
      end
    end
  end
end

Middleman::Extensions.register :linked_in, LinkedIn
