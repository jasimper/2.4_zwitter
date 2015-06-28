require_relative 'zwittermodule'

class Notify
  include Zwittermodule

  attr_accessor :notifier, :notified, :timestamp

  def initialize(zombie_notifier, zombie_to_notify, created_time)
    self.notifier = zombie_notifier
    self.notified = zombie_to_notify
    self.timestamp = created_time
  end

  # My basic idea was to be able to notify users of being followed, getting a reply to a tweet, or
  # even a fav by pushing the notification into their tweet feed. Sadly, I can't seem to get it to
  # work and I'm not sure why. Other than creating this class and including it as required in the
  # program.rb file, I've removed all other attempts at linking these methods to other methods (like
  # follow_zombie) because it was breaking the app.

  def notify_of_follow(zombie_notifier, zombie_to_notify, created_time)
    zombie_to_notify.tweet_feed.push("#{zombie_notifier} started following you at #{created_time}.")
  end

  def reply_to_tweet
  end

end
