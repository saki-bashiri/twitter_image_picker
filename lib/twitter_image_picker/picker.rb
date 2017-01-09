require "twitter_image_picker/client"
require "twitter_image_picker/storager"
module TwitterImagePicker
  class Picker
    def initialize
      @client = TwitterImagePicker::Client.new
      @tweets = []
    end

    def search(keyword)
      q = [keyword, "filter:images"].join(" ")
      @tweets = @client.search(q)
    end

    def output(output_dir)
      storager = TwitterImagePicker::Storager.new(output_dir)
      image_urls.each do |image_url|
        storager.output(image_url)
      end
    end

    private

    def image_urls
      results = []
      @tweets.each do |tweet|
        results += tweet.media.map{|medium| medium.media_url.to_s}
      end
      results
    end
  end
end
