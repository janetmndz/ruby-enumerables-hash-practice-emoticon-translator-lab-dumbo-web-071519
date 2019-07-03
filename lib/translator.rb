# require modules here
require "yaml"
def load_library(yaml_file)
  library = YAML.load_file(yaml_file)
  emoticons_library = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each {|meaning, emoticon|
    if !emoticons_library["get_meaning"].include?emoticon[1]
      emoticons_library["get_meaning"][emoticon[1]] = meaning
    end
    if !emoticons_library["get_emoticon"].include?emoticon[0]
      emoticons_library["get_emoticon"][emoticon[0]] = emoticon[1]
    end
  }
  emoticons_library
end

def get_japanese_emoticon(file, english_emoticon)
  library = load_library(file)
  
  if library["get_emoticon"].include?(english_emoticon)
    p library["get_emoticon"][english_emoticon]
  else
    p "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  library = load_library(file)
  
end