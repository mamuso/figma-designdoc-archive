require 'net/http'
require 'uri'
require 'json'
require 'dotenv'

class FigmaDesigndoc
  def initialize(site)
    # load .env file
    Dotenv.load

    # set figma token. Values in the .env always take precedence
    @figmatoken = ENV['FIGMATOKEN'] ? ENV['FIGMATOKEN'] : site.config["figmaconfig"]["token"]

    puts @figmatoken

  end

  # get the json of a given doc
  def getDoc(doc)
    uri = URI.parse("https://api.figma.com/v1/files/#{doc}")
    request = Net::HTTP::Get.new(uri)
    request["X-Figma-Token"] = @figmatoken

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    puts response.body
  end

end

# Generate everything we need after initializing the site
Jekyll::Hooks.register :site, :after_init do |site|
  figma = FigmaDesigndoc.new(site)
end