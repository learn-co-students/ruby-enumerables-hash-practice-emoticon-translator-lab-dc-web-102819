# require modules here
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  #puts emoticons
  emoticons
  
  emoji_lookup = {
    'get_meaning': {},
    'get_emoticon': {}
  }
  
  emoticons.each do |key, value|
    
    emoji_lookup[:get_meaning][value[1]] = key
    emoji_lookup[:get_emoticon][value[0]] = value[1]
    
  end
  puts emoji_lookup
  emoji_lookup
end

def get_japanese_emoticon(library,emoji)
  output = load_library(library)[:get_emoticon][emoji]
  output ? output : "Sorry, that emoticon was not found"
end

def get_english_meaning(library, japanese_emoji)
  output = load_library(library)[:get_meaning][japanese_emoji]
  output ? output : "Sorry, that emoticon was not found"
end