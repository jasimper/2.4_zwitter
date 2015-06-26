require 'minitest/autorun'
require '../classes/zombie'

class ZombieTest < MiniTest::Test
  def setup do
    @zombie = Zombie.new(username: 'testname', password: 'testpassword')
  end

  def test_created_zombie
    assert_equal '', @zombie.first_name
    assert_equal '', @zombie.last_name
    assert_equal '', @zombie.location
    assert_equal '', @zombie.bio
    assert_equal "http://zombieportraits.com/wp-content/uploads/2011/10/slow-zombie.jpg", @zombie.image
    assert_equal 'testname', @zombie.username
    assert_equal 'testpassword', @zombie.password
  end

end
