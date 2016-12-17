require "twitter_image_picker/client"
module TwitterImagePicker
  class Picker
    def initialize
      @client = TwitterImagePicker::Client.new
    end

    def search(keyword)
      @tweets = @client.search(keyword)
    end
  end
end
