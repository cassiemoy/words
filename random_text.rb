def build_paragraph(words)
  paragraph = []
  10.times { paragraph << words.sample(10).join(" ").capitalize + '.' }
  return paragraph.join(" ")
end

def wrap_text(paragraph)
  line = ''

  paragraph.split(" ").each do |word|
    new_length = line.length + word.length + 1

    if line.length <= 80 && new_length > 80
      print line + "\n"
      line = word + ' '
    else
      line += word + ' '
    end
  end

  print line + "\n"
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
  all_words.delete("")
  paragraph = build_paragraph(all_words)
  wrap_text(paragraph)
end

loop do
  generate()
end