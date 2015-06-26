class Following
  attr_accessor :follower, :followed, :timestamp

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
  end

  def unfollow(zombie_follower, zombie_to_unfollow)
    self.follower = nil
    self.followed = nil
    self.timestamp = nil
    zombie_follower.following.delete_if { |zombie| zombie == zombie_to_unfollow }
    zombie_to_unfollow.followers.delete_if { |zombie| zombie == zombie_follower }
  end
end
