Zombie Twitter Notes

Objects:

Zombie
  # zombie_id
  #   a unique identifier for this zombie
  first name
    the first name of the Zombie
  last name
    the last name of the Zombie
  username
    the username for this Zombie
  password
    the password for this Zombie
  location
    where this Zombie live
  bio
    small description defined by Zombie
  image ( > default is lego zombie)
    profile picture uploaded by Zombie (or default)
  tweets
    array of all tweets posted by this instance

  # favorites
  #   array of all tweets posted by other Zombies which this instance favorited
  following
    array of all Zombies followed by this instance
  followers
    array of all Zombies following this instance
  tweet_feed
    array of all tweets posted by Zombies followed


  .create
    create new instance and assign some attributes
  .begone
    delete instance (sort of???)
  .create_tweet
    create a new Tweet instance and assign some attributes
  .delete_tweet
    delete a Tweet instance (for Tweets created by this Zombie)
  .follow_zombie
    calls the array of all Zombies following this instance
  .show_my_tweets
    calls the array of tweets posted by this Zombie
  .show_tweet_feed
    calls the array of all tweets posted by Zombies followed

Tweet
  author
    zombie who posted the tweet
  content
    string defined by user when creating tweet
  timestamp
    time tweet was created
  location
    optional field that author can define
  attachment
    optional thing author can provide
  retweets
    array of all tweet instances created via retweet of current tweet
  retweeted by __
    array of zombies who have retweeted the current tweet
  # faves

  .create
    create a new tweet instance and assign some attributes
  .destroy
    delete instance (sort of???)
  .all/index
    pull all tweets ever? or pull specific zombies tweets?
  .sort #changed this to program method, not class method
    sort collection of tweets based on an attribute?
  .view/read
    view a specified tweet
  .retweet
    creates carbon copy of the tweet with author set to retweeter
  # .number of faves

Following
  follower
    a zombie who is folllowing another zombie
  followed
    a zombie whom another zombie is following
  timestamp
    the time the follower decided to follow
  .create
    create the 'following' relationship between the two zombies
  .unfollow
    remove the 'following' relationship between the two zombies


# Objects to work on later:

# Favorites
#   > tweet
#   > who done it
#   > when favorited
# Topic
# Images
# Notification

CRUD
Create Read Update Destroy
(relates to a singular record)
