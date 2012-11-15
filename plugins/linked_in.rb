
class LinkedInPlugin

  def build_profiles(builder, data)
    return unless data.linked_in
    builder.add_profile 'linked_in', data.linked_in, 'LinkedIn'
  end
end

Branding::Plugins.add LinkedInPlugin.new
