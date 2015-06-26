require './classes/zombie'
require './classes/tweet'
require './classes/following'

def sort_tweets(array_of_tweets)
  sorted_tweets = []
  sorted_tweets = array_of_tweets.sort do |tweet1, tweet2|
    tweet2.timestamp <=> tweet1.timestamp
  end
  # puts sorted_tweets.map { |tweet| "#{tweet.content} (Tweeted #{tweet.timestamp} by #{tweet.author.username})" }
  puts sorted_tweets.map { |tweet| tweet.format_tweet}
end


tom = Zombie.new(username: "tom_the_zombie", password: "brains")
tom.create_tweet(content: "I ate some brains. They were tasty.")
sleep(3)

puts tom.username
tom.show_my_tweets

ann = Zombie.new(username: "zombieann", password: "brains")
ann.create_tweet(content: "Will work for brains")
sleep(3)
tom.create_tweet(content: "Oh look! More brains! om nom nom...")
sleep(3)
ann.create_tweet(content: "On second thought, kidneys sound better")
puts ann.username
ann.show_my_tweets

sort_tweets(Tweet.all)


# tom.follow_zombie(ann)
# puts "Zombies following #{tom.username}: #{tom.show_my_followers}"
# puts "Zombies followed by #{tom.username}: #{tom.show_zombies_followed}"
#
# puts "Zombies following #{ann.username}: #{ann.show_my_followers}"
# puts "Zombies followed by #{ann.username}: #{ann.show_zombies_followed}"
