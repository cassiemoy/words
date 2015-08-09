def build_paragraph(words)
  paragraph = []
  10.times { paragraph << words.sample(10).join(" ").capitalize + '.' }
  return paragraph
end

def wrap_text(paragraph)
  line = ''
  overflow = []

  paragraph.each do |sentence|
    exploded = sentence.split(" ")

    exploded.each do |word|
      if line.length <= 80 && line.length + word.length > 80
        print line + "\n"
        line = overflow.join(" ")
        overflow.clear()
      end

      if line.length + word.length <= 80
        line += word + ' '
      else
        overflow << word
      end
    end
  end
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
  all_words.delete(" ")
  paragraph = build_paragraph(all_words)
  wrap_text(paragraph)
end

generate()

# Test cases
# What if the 80 char limit is impossible?