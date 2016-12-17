require "twitter_image_picker/client"
module TwitterImagePicker
  class Picker
    def initialize
      @client = TwitterImagePicker::Client.new
    end

    def search(keyword)
      q = [keyword, "filter:images"].join(" ")
      @tweets = @client.search(q)
    end

    def image_urls
      results = []
      @tweets.each do |tweet|
        results += tweet.media.map{|medium| medium.media_url.to_s}
      end
      results
    end
  end
end
