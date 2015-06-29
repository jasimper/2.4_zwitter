require_relative 'zwittermodule'
require_relative 'notify'

class Following
  include Zwittermodule

  attr_accessor :follower, :followed, :timestamp

  def initialize(zombie_follower, zombie_to_follow)
    self.follower = zombie_follower
    self.followed = zombie_to_follow
    self.timestamp = Time.now
    if zombie_follower.following.include?(zombie_to_follow)
      puts "You are already following #{zombie_to_follow}!"
    else
      zombie_follower.following.push(zombie_to_follow)
    end
    unless zombie_to_follow.followers.include?(zombie_follower)
      zombie_to_follow.followers.push(zombie_follower)
      notice = Notify.new(self.follower, self.followed)
      notice.send_notice_of_follow
    end
  end

  def self.destroy(zombie_follower, zombie_to_unfollow)
    # we have not yet solved the problem of deleting the whole instance
    # for now, we are just removing the follower/followee from the arrays
    # of followers/followees
    zombie_follower.following.delete_if { |zombie| zombie == zombie_to_unfollow }
    zombie_to_unfollow.followers.delete_if { |zombie| zombie == zombie_follower }
  end
end
