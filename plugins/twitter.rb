
class TwitterPlugin
  def build_sections(builder, data)
    return unless data.twitter
    builder.add_section :blogger,
      'Twitter',
      url: "http://twitter.com/#{data.twitter}"
  end
end

Branding::Plugins.add TwitterPlugin.new


