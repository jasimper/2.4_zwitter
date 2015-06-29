require_relative 'zwittermodule'

class Zombie
  include Zwittermodule

  attr_accessor :first_name, :last_name, :username, :password, :location, :bio,\
                :image, :tweets, :timestamp, :following, :followers, :tweet_feed

  def initialize(username:, password:, first_name: "", last_name: "", location: "", bio: "", image: "http://vignette3.wikia.nocookie.net/lego/images/8/81/Zombie_Groom.png/revision/latest?cb=20120823164249")
    self.username = username
    self.password = password
    self.first_name = first_name
    self.last_name = last_name
    self.location = location
    self.bio = bio
    self.image = image
    @tweets, @following, @followers, @tweet_feed = [], [], [], []
    self.timestamp = Time.now
  end

  def begone
    # we have not yet solved the problem of deleting the whole instance, so we are
    # assigning all of the attributes to nil (or clearing any attributes which are arrays)
    @first_name, @last_name, @username, @password, @location, @bio, @image, @timestamp = nil
    params_to_clear = [@following, @followers, @tweet_feed, @tweets]
    clear_param_arrays(params_to_clear)
    # should think about how to remove a zombie from the "followers" array of other
    # zombies, should the following instance not be removed before user deletion
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
    Following.new(self, zombie_friend)
  end

# Note that unfollowing does not remove existing tweets from the unfollowed
# zombie's tweet feed (not sure why yet).
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
