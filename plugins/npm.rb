
class NodePlugin
  def build_sections(builder, data)
    return unless data.npm
    builder.add_section :developer,
      'Node.js',
      url: "https://npmjs.org/~#{data.npm}"
  end
end

Branding::Plugins.add NodePlugin.new
