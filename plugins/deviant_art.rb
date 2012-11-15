
class DeviantArtPlugin
  def build_sections(builder, data)
    return unless data.deviant_art
    builder.add_section :artist,
      'DeviantArt',
      url: "http://#{data.deviant_art}.deviantart.com"
  end
end

Branding::Plugins.add DeviantArtPlugin.new
