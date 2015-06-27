require_relative 'zwittermodule'

class Following
  include Zwittermodule

  attr_accessor :follower, :followed, :timestamp

#  @@all_followings = []

  def initialize(zombie_follower, zombie_to_follow, created_time)
    self.follower = zombie_follower
    self.followed = zombie_to_follow
    self.timestamp = created_time
    if zombie_follower.following.include?(zombie_to_follow)
      puts "#{zombie_follower} is already following #{zombie_to_follow}!"
    else
      zombie_follower.following.push(zombie_to_follow)
    end

    if zombie_to_follow.followers.include?(zombie_follower)
      puts "#{zombie_to_follow} is already followed by #{zombie_follower}!"
    else
      zombie_to_follow.followers.push(zombie_follower)
    end

#    @@all_followings.push({self: {followed_by: self.follower, is_followed: self.followed, follow_date: self.timestamp}})
  end

  def self.destroy(zombie_follower, zombie_to_unfollow)
    # # would like to get this working, but having some trouble
    # # first, we need to find the instance of the following
    # the_following = @@all_followings.select do |following_hash|
    #   following_hash.select { |k, v| v.has_value?(zombie_follower)}
    # end
    # # now we can reassign the attributes to nil
    # the_following[0][:self].follower = nil
    # the_following[0][:self].followed = nil
    # the_following[0][:self].timestamp = nil

    # and remove the follower/followee from each zombie's array of followers/followees
    zombie_follower.following.delete_if { |zombie| zombie == zombie_to_unfollow }
    zombie_to_unfollow.followers.delete_if { |zombie| zombie == zombie_follower }
  end
end
