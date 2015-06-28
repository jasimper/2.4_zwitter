require_relative 'zwittermodule'
require_relative 'tweet'

class Notify < Tweet
  include Zwittermodule

  attr_accessor :notifier, :notified
# removed notifier; if the notice will be like a tweet, the author is the notifier
# removed timestamp, since it already exists under the Tweet class (though it
# still needed to be assigned a time on initialization)

  def initialize(zombie_notifier, zombie_to_notify)
    self.author = zombie_notifier
    self.notified = zombie_to_notify
    self.timestamp = Time.now
    self.content = ("#{self.author.username} started following #{self.notified.username} at #{self.display_time}.")
  end

  # My basic idea was to be able to notify users of being followed, getting a reply to a tweet, or
  # even a fav by pushing the notification into their tweet feed. Sadly, I can't seem to get it to
  # work and I'm not sure why. Other than creating this class and including it as required in the
  # program.rb file, I've removed all other attempts at linking these methods to other methods (like
  # follow_zombie) because it was breaking the app.

  def send_notice_of_follow
    self.author.tweets.push(self)
    # self.notified.tweet_feed.push(self)
  end

  def reply_to_tweet
  end

end
