require 'minitest/autorun'
require_relative '../required/tweet'

class TweetTest < Minitest::Test

  def setup
    @tweet = Tweet.new
    @tweet.author = "testzombie"
    @tweet.content = "test tweet content"
    @tweet.timestamp = "d/m/y h:m"
  end

  def test_create_tweet
    assert_equal nil, @tweet.location
    assert_equal nil, @tweet.attachment
    assert_equal 'testzombie', @tweet.author
    assert_equal 'test tweet content', @tweet.content
    assert _equal 'd/m/y h:m', @tweet.timestamp
  end

  def test_delete_tweet
    @tweet.delete
      assert_equal nil, @tweet.content
      assert_equal nil, @tweet.timestamp
      assert_equal nil, @tweet.location
      assert_equal nil, @tweet.attachment
      assert_equal nil, @tweet.retweets
      assert_equal nil, @tweet.retweeted_by
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
