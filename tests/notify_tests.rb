require 'minitest/autorun'
require_relative '../required/tweet'
require_relative '../required/zombie'

class NotifyTest < Minitest::Test

  def setup
    @zombie1 = Zombie.new(username: "test zombie 1", password: "pw")
    @zombie2 = Zombie.new(username: "test zombie 2", password: "pw")
    @test_time = Time.new(2015, 03, 14, 9, 26, 53, "-04:00")
    @notice = Notify.new(@zombie1, @zombie2)
  end

  def test_verify_notice_content
    assert_equal "test zombie 1 started following you at 14/03/2015 09:26", @notice.content
    assert_equal @zombie1, @notice.author
    assert_equal @zombie2, @notice.notified
  end

  def verify_notice_added_to_feed
    @notice.send_notice_of_follow
    assert_includes @zombie1.tweets, @notice
    # assert_includes @zombie2.tweet_feed, @notice
  end
