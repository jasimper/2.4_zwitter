require 'minitest/autorun'
require_relative '../required/tweet'
require_relative '../required/zombie'

class TweetTest < Minitest::Test

  def setup
    @tweet = Tweet.new
    @tweet.author = Zombie.new(username: "testzombie", password: "testpassword")
    @tweet.content = "test tweet content"
    @tweet.timestamp = Time.new(2015, 03, 14, 9, 26, 53, "-04:00")
  end

  def test_create_tweet
    assert_equal nil, @tweet.location
    assert_equal nil, @tweet.attachment
    assert_equal 'testzombie', @tweet.author.username
    assert_equal 'test tweet content', @tweet.content
    assert_match "2015-03-14 09:26:53 -0400", @tweet.timestamp.to_s
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

  def test_format_tweet
    expected_format = "test tweet content (Tweeted 14/03/2015 09:26 by testzombie)"
    assert_equal expected_format, @tweet.format_tweet
  end

  def test_format_tweet
    expected_out = "test tweet content (Tweeted 14/03/2015 09:26 by testzombie)"
    out, _ = capture_io do
      @tweet.view
    end
    assert_equal expected_out.strip, out.strip
  end

  def test_retweet
    @retweeter = Zombie.new(username: "testretweeter", password: "testpassword")
    @retweet = @tweet.retweet(retweeter: @retweeter)
    assert_equal nil, @retweet.location
    assert_equal nil, @retweet.attachment
    assert_equal 'testretweeter', @retweet.author.username
    assert_match Time.now.to_s, @retweet.timestamp.to_s
    out, _ = capture_io do
      @retweet.view
    end
    expected_out = %{
      testretweeter retweeted on #{Time.now.strftime("%d/%m/%Y %H:%M")}:
      test tweet content
      (Originally tweeted 14/03/2015 09:26 by testzombie)}
    assert_equal expected_out.strip, out.strip
    assert_includes @retweeter.tweets, @retweet
    assert_includes @tweet.retweets, @retweet
    assert_includes @tweet.retweeted_by, @retweeter
  end

end
