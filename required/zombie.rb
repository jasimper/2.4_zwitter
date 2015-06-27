require_relative 'zwittermodule'

class Zombie
  include Zwittermodule

  attr_accessor :first_name, :last_name, :username, :password, :location, :bio,\
                :image, :tweets, :timestamp, :following, :followers, :tweet_feed

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
    self.timestamp = Time.now
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
    self.timestamp = nil
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
    self.tweets.delete(tweet)
    tweet.delete
  end

  def follow_zombie(zombie_friend)
    Following.new(self, zombie_friend, Time.now )
  end

  def unfollow_zombie(zombie_enemy)
    Following.destroy(self, zombie_enemy)
  end

  def show_my_tweets
    puts "My zweets:"
    self.tweets.each do |tweet|
      puts "#{tweet.content} (Tweeted #{tweet.display_time})"
    end
  end

  def show_tweet_feed
    puts "Zweets from my Zombie pals:"
    all = []
    self.following.each do |zombiepal|
      all.push(zombiepal.tweets)
    end
    all = all.flatten
    sort_tweets(all)
  end

  def show_my_followers
    puts "Zombies following me:"
    puts self.followers.map(&:username)
  end

  def show_zombies_followed
    puts "Zombies I follow:"
    puts self.following.map(&:username)
  end

  def profile
    puts "#{self.username}'s Profile:"
    puts "(un)living in #{self.location}" unless self.location == ""
    puts "Zweeting since #{self.display_time}"
    puts self.bio unless self.bio == ""
    system("open", self.image)
    puts "\n"
    self.show_my_followers
    puts "\n"
    self.show_zombies_followed
  end

  def self.all; ObjectSpace.each_object(self).to_a end
end
