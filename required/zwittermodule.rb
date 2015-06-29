module Zwittermodule

  # use this to format timestamps nicely
  def display_time
    self.timestamp.strftime("%d/%m/%Y %H:%M")
  end

  # use this to sort tweets by timestamp
  def sort_tweets(array_of_tweets)
    sorted_tweets = []
    sorted_tweets = array_of_tweets.sort do |tweet1, tweet2|
      tweet2.timestamp <=> tweet1.timestamp
    end
    puts sorted_tweets.map { |tweet| tweet.format_tweet}
  end

  # use this to clear instance parameters which are arrays
  def clear_param_arrays(array_of_params)
    array_of_params.cycle(1) { |x| x.clear}
  end

end
