require 'minitest/autorun'
require_relative '../required/zombie'

class ZombieTest < Minitest::Test

  def setup
    @zombie = Zombie.new(username: 'testname', password: 'testpassword')
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
    assert_equal @zombie.created_at, nil
    assert_equal @zombie.location, nil
    assert_equal @zombie.bio, nil
    assert_equal @zombie.image, nil
    assert_equal @zombie.following, nil
    assert_equal @zombie.followers, nil
    assert_equal @zombie.tweet_feed, nil
  end

end
