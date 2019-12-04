# require modules here
require 'yaml'
require 'pry'

# accepts one argument, the file path
# has two keys, 'get_meaning' and 'get_emoticon'
# the keys 'get_meaning' and 'get_emoticon' point to inner hashes
# creates the hash of "get_emoticons"and "get_meaning"
def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |key, value|
    emoticon_hash["get_emoticon"][value.first] = value.last
    # binding.pry
    emoticon_hash["get_meaning"][value.last] = key
  end
  emoticon_hash
end
# def load_library(path)
#   emoticons = YAML.load_file(path)
#   new_hash = {"get_emoticon" => nil, "get_meaning" => nil}
#   # new_hash["get_emoticon"] = emoticons
#   # emoticon_hash = new_hash["get_emoticon"]
#   emoticons.each do |key, value|
#     # how can we get the key and value from 
#     # from an hash of an array
#     value[0] = value[1]
#     # new_hash["get_emoticon"][value.first] = value.last
    
#     # new_hash["get_emoticon"] = key
#     # new_hash["get_meaning"] = value
#     # binding.pry
#     # binding.pry

#   end
#   # code goes here
# end

# it "accepts two arguments, path and the emoticon" do

def get_japanese_emoticon(path, emoticon)
  # call the previous method and use its parameters 
  #  for it to work
  # retrive 
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  # binding.pry
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end









