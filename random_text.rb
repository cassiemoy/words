def build_paragraph(words)
  10.times do
    print build_sentence(words) + "\n"
  end
end

def build_sentence(words)
  sentence = words.sample(10)
  sentence.join(' ').capitalize + '.'
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
  build_paragraph(all_words)
end

generate()

# Test cases
# What if the 80 char limit is impossible?