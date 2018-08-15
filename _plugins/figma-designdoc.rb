require 'net/http'
require 'uri'
require 'json'
require 'dotenv'

class FigmaDesigndoc
  def initialize(site)
    Dotenv.load

    # set figma token. Values in the .env always take precedence
    @figmatoken = ENV['FIGMATOKEN'] ? ENV['FIGMATOKEN'] : site.config["figmaconfig"]["token"]
    @figmadocuments = site.config["figmaconfig"]["documents"]
    @figmascale = site.config["figmaconfig"]["scale"]
  end

  def fetch
    @figmadocuments.each do |doc|

      content = JSON.parse self.getDoc(doc)
      pages = content["document"]["children"]

      # Let's generate a markdow per page
      pages.each do |page|
        self.writeMarkdown(page) if parseElement?(page["name"])
      end

    end
  end

  # write a markdow document for each page
  def writeMarkdown(page)
    layers = page["children"].reverse

    # Do we have a preface?
    preface = layers.select do |layer|
      layer["type"] == "TEXT"
    end
    # preface["characters"]

    # Let's get only the frames
    frames = layers.select do |layer|
      layer["type"] === "FRAME"
    end
    
    # Let's get the text layers
    text = layers.select do |layer|
      layer["type"] === "TEXT"
    end

  end

  # decidign if we should parse an element or not
  def parseElement?(string)
    return string.start_with?("~") ? false : true
  end

  # decidign if we should show the title above an element or not
  def showTitle?(string)
    return string.start_with?("_") ? false : true
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
    return response.body
  end

end

# Generate everything we need after initializing the site
Jekyll::Hooks.register :site, :after_init do |site|

  figma = FigmaDesigndoc.new(site)
  figma.fetch

end