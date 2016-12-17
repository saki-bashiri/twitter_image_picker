require 'twitter'
module TwitterImagePicker
  class Client
    def initialize
      @client = ::Twitter::REST::Client.new(
        consumer_key: ENV['TWITTER_IMAGE_PICKER_CONSUMER_KEY'],
        consumer_secret: ENV['TWITTER_IMAGE_PICKER_CONSUMER_SECRET'],
        access_token: ENV['TWITTER_IMAGE_PICKER_ACCESS_TOKEN'],
        access_token_secret: ENV['TWITTER_IMAGE_PICKER_ACCESS_TOKEN_SECRET'],
      )
    end

    def search(keyword)
      @client.search(
        keyword,
        count: 30,
        result_type: "recent",
        exclude: "retweets",
        since_id: nil
      )
    end
  end
end
