require "yaml"

def load_library(file_path)
  emoticon_file = YAML.load_file(file_path)
  result = {}


  point_to_meaning = {}
  emoticon_file.map { | meaning, emoticons |
    emoticons.map { | emoticon |
      point_to_meaning[emoticon] = meaning
    }
  }

  emoticon_pairs = []
  emoticon_pairs = emoticon_file.map { |meaning, emoticons|
    [emoticons]
    }

  point_to_English = Hash[emoticon_pairs.map { | english_emoticon, japanese_emoticon |
    japanese_emoticon = english_emoticon
    }]

  result[:get_meaning] = point_to_meaning
  result[:get_emoticon] = point_to_English

  result
end

def get_japanese_emoticon(file_path, emoticon)
    emoticon_library = load_library(file_path)
    if emoticon_library[:get_emoticon][emoticon]
      emoticon_library[:get_emoticon][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, emoticon)
    emoticon_library = load_library(file_path)
    if emoticon_library[:get_meaning][emoticon]
      emoticon_library[:get_meaning][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end
