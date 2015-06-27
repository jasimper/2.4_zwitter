require 'minitest/autorun'
require_relative '../required/zombie'
require_relative '../required/tweet'
require_relative '../required/following'

class ZombieTest < Minitest::Test

  def setup
    @zombie = Zombie.new(username: 'testname', password: 'testpassword')
    @tweet = @zombie.create_tweet(content: "test content", location: "here")
    @zfollowed = Zombie.new(username: 'testfollowed', password: 'testpassword')
    @followed_tweet = @zfollowed.create_tweet(content: "test moar content", location: "there")
    @zombie.follow_zombie(@zfollowed)
  end

  def test_created_zombie
    assert_equal '', @zombie.first_name
    assert_equal '', @zombie.last_name
    assert_equal '', @zombie.location
    assert_equal '', @zombie.bio
    assert_equal 'http://vignette3.wikia.nocookie.net/lego/images/8/81/Zombie_Groom.png/revision/latest?cb=20120823164249', @zombie.image
    assert_equal 'testname', @zombie.username
    assert_equal 'testpassword', @zombie.password
  end

  def test_delete_user
    @zombie.begone
    assert_equal @zombie.username, nil
    assert_equal @zombie.password, nil
    assert_equal @zombie.first_name, nil
    assert_equal @zombie.last_name, nil
    assert_equal @zombie.timestamp, nil
    assert_equal @zombie.location, nil
    assert_equal @zombie.bio, nil
    assert_equal @zombie.image, nil
    assert_equal @zombie.following, nil
    assert_equal @zombie.followers, nil
    assert_equal @zombie.tweet_feed, nil
  end

  def test_created_tweet_added_to_my_tweets
    assert_includes @zombie.tweets, @tweet
    assert_equal @tweet, @zombie.tweets[0]
    assert_equal "here", @zombie.tweets[0].location
  end

  def test_deleted_tweet_removed_from_my_tweets
    @zombie.delete_tweet(@tweet)
    refute_includes @zombie.tweets, @tweet
  end

  def test_show_my_tweets
    out, err = capture_io do
      @zombie.show_my_tweets
    end
    expected_out_msg = "My zweets:"
    expected_out_content = "test content (Tweeted #{Time.now.strftime("%d/%m/%Y %H:%M")})"
    assert_match expected_out_msg, out
    assert_match expected_out_content, out
  end

  def test_show_tweet_feed
    out, err = capture_io do
      @zombie.show_tweet_feed
    end
    expected_out_msg = "Zweets from my Zombie pals:"
    expected_out_content = "test moar content (Tweeted #{Time.now.strftime("%d/%m/%Y %H:%M")} by testfollowed)"
    assert_match expected_out_msg, out
    assert_match expected_out_content, out
  end

  def test_successful_follow
    skip
  end

  def test_successful_unfollow
    skip
  end

  def test_show_followers
    skip
  end

  def test_show_zombies_followed
    skip
  end

  def test_show_profile
    skip
  end

end
