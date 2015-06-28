require_relative 'zwittermodule'

class Notify
  include Zwittermodule

  attr_accessor :notifier, :notified, :timestamp

  def initialize(zombie_notifier, zombie_to_notify, created_time)
    self.notifier = zombie_notifier
    self.notified = zombie_to_notify
    self.timestamp = created_time
  end

  def notify_of_follow(zombie_notifier, zombie_to_notify, created_time)
    zombie_to_notify.tweet_feed.push("#{zombie_notifier} started following you at #{created_time}.")
  end

  def reply_to_tweet
  end

end
