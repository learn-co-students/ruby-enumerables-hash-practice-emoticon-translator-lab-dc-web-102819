# require modules here
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,value|
    new_hash['get_emoticon'][value[0]] = emoticons[key][1]
    new_hash['get_meaning'][value[1]] = key
  end

 pp new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)['get_emoticon'][emoticon]
  if !result
    "Sorry, that emoticon was not found"
  else
    result
  end
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)['get_meaning'][emoticon]
  if !result
      "Sorry, that emoticon was not found"
    else
      result
    end
end