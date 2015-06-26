class Tweet
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

  def self.all; ObjectSpace.each_object(self).to_a end

  def format_tweet
    "#{self.content} (Tweeted #{self.timestamp.strftime("%d/%m/%Y %H:%M")} by #{self.author.username})"
  end

  def view
    puts "#{self.content} (Tweeted #{self.timestamp.strftime("%d/%m/%Y %H:%M")} by #{self.author.username})"
  end

  def retweet(retweeter:, location: nil)
    t = Tweet.new
    t.author = retweeter
    t.timestamp = Time.now  #use .strftime("%d/%m/%Y %H:%M") to display timestamp
    t.location = :location
    t.attachment = self.attachment
    t.content = %{
      #{t.author} retweeted on #{t.timestamp.strftime("%d/%m/%Y %H:%M")}:
      #{self.content}
      (Original tweeted #{self.timestamp.strftime("%d/%m/%Y %H:%M")} by #{self.author})
      }
    retweeter.tweets.push(t)
    self.retweets.push(t)
    self.retweeted_by.push(t.author)
    t
  end

end
