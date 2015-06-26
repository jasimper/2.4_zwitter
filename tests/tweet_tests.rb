require 'minitest/autorun'
require '../classes/zombie'

class TweetTest < MiniTest::Test
  def setup do
    @tweet = Tweet.new()
  end

  def test_tweet
    # assert_equal '', @tweet.author
    # assert_equal '', @zombie.last_name
    # assert_equal '', @zombie.location
    # assert_equal '', @zombie.bio
    # assert_equal 'testname', @zombie.username
    # assert_equal 'testpassword', @zombie.password
  end

  def test_retweet
    # user wants to retweet an existing tweet
    # create a carbon-copy of the existing tweet (as a new instance)
    # new tweet has 'retweeter' as the author and new timestamp
    # add the new tweet to the 'retweeters' array of tweets
    # add the new tweet to the original tweets retweets array
    # add the 'retweeter' to the original tweets retweeted_by array
    #

  end

end
