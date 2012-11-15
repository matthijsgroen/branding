
class GithubPlugin
  def build_sections(builder, data)
    return unless data.github
    builder.add_section :developer,
      'Github',
      url: "https://github.com/#{data.github}"
  end
end

Branding::Plugins.add GithubPlugin.new
