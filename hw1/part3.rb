def combine_anagrams(words)
  output_array = Array.new(0)
  words.each do |word1|
    temp_array = []
    words.each do |word2|
      if (word2.downcase.split(//).sort == word1.downcase.split(//).sort)
        temp_array.push(word2)
      end
    end
    output_array.push(temp_array)
  end
  output_array.uniq
end
