
class RssBlogsPlugin
  def build_sections(builder, data)
    return unless data.rss_blogs
    data.rss_blogs.each do |blog_info|
      builder.add_section :blogger,
        blog_info.name,
        url: blog_info.url
    end
  end
end

Branding::Plugins.add RssBlogsPlugin.new

