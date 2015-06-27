require_relative 'zombie'
require_relative 'tweet'
require_relative 'following'

def show_logo
  logo = IO.read('./zwitter_logo.txt')
  puts logo
end
