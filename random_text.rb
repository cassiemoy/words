def build_paragraph()
end

def build_sentence(words)
  sentence = words.sample(10)
  return sentence
end

def generate()
  input = '';

  Dir.entries('.').each do |i|
    if File.extname(i) == '.txt'
      input = i
    end
  end

  content = File.read(input)
  all_words = []
  content.split(/\s/).each { |word| all_words << word.gsub(/\W/, '').downcase }
  
  p build_sentence(all_words)

end

generate()