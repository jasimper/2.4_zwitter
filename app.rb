require './required/program'

show_logo

tom = Zombie.new(username: "tom_the_zombie", password: "brains")
tom.create_tweet(content: "I ate some brains. They were tasty.")
sleep(3)

puts tom.username
tom.show_my_tweets

ann = Zombie.new(username: "zombieann", password: "brains")
ann.create_tweet(content: "Will work for brains")
tom.create_tweet(content: "Oh look! More brains! om nom nom...")
sleep(3)
ann.create_tweet(content: "On second thought, kidneys sound better")
puts "\n#{ann.username}"
ann.show_my_tweets
sleep(3)
tom.follow_zombie(ann)
puts "\nI'm #{tom.username} and this is my zweet feed:"
tom.show_tweet_feed
sleep(3)
ann.follow_zombie(tom)
puts "\nI'm #{ann.username} and this is my zweet feed:"
ann.show_tweet_feed
sleep(3)

# puts "\n"
# tom.profile
# sleep(3)

puts "\n"
tom.show_my_tweets

puts "\n Deleting tom_the_zombie's first tweet..."
tom.delete_tweet(tom.tweets[1])
sleep(3)
puts "\n"
tom.show_my_tweets
ann.show_tweet_feed


puts "\n"
ann.show_my_followers

puts "\n Deleting tom_the_zombie's following of zombieann..."
 tom.unfollow_zombie(ann)
sleep(3)
puts "\n"
tom.show_zombies_followed
ann.show_my_followers
