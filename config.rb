require 'digest/md5'
require 'branding'
###
# Branding Modules
###
activate :sprockets
activate :i18n
activate :personal_branding

###
# Plugins
###
activate :linked_in
activate :github
activate :coderwall

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do

  def gravatar_url(email)
    digest = Digest::MD5.hexdigest email
    "http://www.gravatar.com/avatar/#{digest}?s=80"
  end

  def role_class(list, element)
    amount = list.size
    index = list.index element

    return "large #{element}" if amount % 3 == 1 and index == 0
    return "medium #{element}" if amount % 3 == 2 and index < 2
    pattern = %w(medium small small)
    pattern_index = (index - (amount % 3))
    reverse = false
    reverse = true if amount % 3 == 2
    reverse = !reverse if (pattern_index / pattern.size).floor % 2 == 0

    pattern_class = pattern[pattern_index % pattern.size]

    pattern_class.concat(" reverse") if reverse
    pattern_class.concat(" #{element}")
  end


  def structure
    {
      developer: {
        "Github" => {
          url: "http://www.github.com/"
        },
        "Coderwall" => {
          url: "http://www.coderwall.com/"
        },
        "Node.js" => {
          url: "http://nodejs.com"
        }
      },
      artist: {
        "DeviantArt" => {
          url: "http://deviantart.com"
        }
      },
      photographer: {
        "Flickr" => {
          url: "http://flickr.com"
        },
        "Picasa" => {
          url: "http://picasaweb.com"
        }
      },
      gamer: {
        "Steam" => {
          url: "http://steampowered.com"
        }
      },
      blogger: {
        "Twitter" => {
          url: "http://twitter.com"
        },
        "Blogger" => {
          url: "http://blogger.com"
        }
      }
    }
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
