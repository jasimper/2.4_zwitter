require_relative 'zwittermodule'

class Tweet
  include Zwittermodule

  attr_accessor :author, :content, :timestamp, :location,\
                :attachment, :retweets, :retweeted_by

  def initialize
    self.retweets = []
    self.retweeted_by = []
  end

  def delete
    self.content = nil
    self.timestamp = nil
    self.location = nil
    self.attachment = nil
    self.retweets = nil
    self.retweeted_by = nil
  end

  def format_tweet
    "#{self.content} (Tweeted #{self.display_time} by #{self.author.username})"
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
    t.content = %{
      #{t.author} retweeted on #{t.display_time}:
      #{self.content}
      (Original tweeted #{self.display_time} by #{self.author})}
    retweeter.tweets.push(t)
    self.retweets.push(t)
    self.retweeted_by.push(t.author)
    t
  end

  def self.all; ObjectSpace.each_object(self).to_a end
end
