require_relative 'zwittermodule'

class Tweet
  include Zwittermodule

  attr_accessor :author, :content, :timestamp, :location,\
                :attachment, :retweets, :retweeted_by, :is_retweet

  def initialize
    @retweets, @retweeted_by = [], []
    self.is_retweet = false
  end

  def delete
    # following line is to ensure that, regardless of how the tweet is deleted,
    # it must be removed from the author's array of tweets
    self.author.tweets.delete(self) if self.author.tweets.include? self
    # we have not yet solved the problem of deleting the whole instance, so we are
    # assigning all of the attributes to nil (or clearing any attributes which are arrays)
    @author, @content, @timestamp, @location, @attachment, @is_retweet = nil
    params_to_clear = [@retweets, @retweeted_by]
    clear_param_arrays(params_to_clear)
  end

  def format_tweet
    original = "#{self.content} (Tweeted #{self.display_time} by #{self.author.username})"
    retweet_or_notice = "#{self.content}"
    (self.is_retweet || self.class == Notify) ? retweet_or_notice : original
  end

  def view
    puts self.format_tweet
  end

  def retweet(retweeter:, location: nil)
    t = Tweet.new
    t.author = retweeter
    t.timestamp = Time.now
    t.location = location
    t.attachment = self.attachment
    t.is_retweet = true
    t.content = %{
      #{t.author.username} retweeted on #{t.display_time}:
      #{self.content}
      (Originally tweeted #{self.display_time} by #{self.author.username})}
    retweeter.tweets.push(t)
    self.retweets.push(t)
    self.retweeted_by.push(t.author)
    t
  end

  def self.all; ObjectSpace.each_object(self).to_a end
end
