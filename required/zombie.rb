require_relative 'zwittermodule'

class Zombie
  include Zwittermodule

  attr_accessor :first_name, :last_name, :username, :password, :location, :bio,\
                :image, :tweets, :created_at, :following, :followers, :tweet_feed

  def initialize(username:, password:, first_name: "", last_name: "", location: "", bio: "", image: "http://zombieportraits.com/wp-content/uploads/2011/10/slow-zombie.jpg")
    self.username = username
    self.password = password
    self.first_name = first_name
    self.last_name = last_name
    self.location = location
    self.bio = bio
    self.image = image
    self.tweets = []
    self.following = []
    self.followers = []
    self.tweet_feed = []
    self.created_at = Time.now
  end

  def begone
    self.first_name = nil
    self.last_name = nil
    self.username = nil
    self.password = nil
    self.location = nil
    self.bio = nil
    self.image = nil
    self.tweets = nil
    self.created_at = nil
    self.following = nil
    self.followers = nil
    self.tweet_feed = nil
  end

  def create_tweet(content:, location: nil, attachment: nil)
    t = Tweet.new
    t.author = self
    t.content = content
    t.timestamp = Time.now
    t.location = location
    t.attachment = attachment
    self.tweets.push(t)
    t
  end

  def delete_tweet(tweet)
    tweet.delete
    self.tweets.delete(tweet)
  end

  def follow_zombie(zombiefriend)
    Following.new(self, zombiefriend, Time.now )
  end

  def show_my_tweets
    self.tweets.each do |tweet|
      puts "#{tweet.content} (Tweeted #{tweet.display_time})"
    end
  end

  def show_tweet_feed
    all = []
    self.following.each do |zombiepal|
      all.push(zombiepal.tweets)
    end
    all = all.flatten
    all.map! { |tweet| tweet.view }
    puts all #only sorted by author, not posted date
    # want to display the tweets sorted by the time tweet was posted
  end

  def show_my_followers
    puts self.followers.map(&:username)
  end

  def show_zombies_followed
    puts self.following.map(&:username)
  end

  def self.all; ObjectSpace.each_object(self).to_a end
end
