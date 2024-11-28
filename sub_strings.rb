def single_word(word, dictionary)
  dictionary.reduce(Hash.new(0)) do |io, element|
    if word.include?(element.downcase)
      io[element] += 1
    end
    io
  end
end

def sub_string(string, dictionary)
  # Pre-process the input string to clean and split words
  array_of_words = string.downcase.gsub(/[^a-z\s]/, '').split(" ")
  
  # Process each word and generate hashes
  array_of_hashes = array_of_words.map do |word|
    if single_word(word, dictionary).empty? == false
       single_word(word, dictionary)
    end
  end.compact

  # Merge hashes into a single hash
  merged_hashes = array_of_hashes.reduce({}) do |accumulator, element|
    accumulator.merge(element) { |key, old_val, new_val| old_val + new_val }
  end

  merged_hashes
end

p sub_string("Howdy partner, sit down! How's it going?", ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"])
