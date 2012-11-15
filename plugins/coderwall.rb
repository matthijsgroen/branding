
class CoderwallPlugin
  def build_sections(builder, data)
    return unless data.coderwall
    builder.add_section :developer,
      'Coderwall',
      url: "https://coderwall.com/#{data.coderwall}"
  end
end

Branding::Plugins.add CoderwallPlugin.new

