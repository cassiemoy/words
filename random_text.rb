def build_paragraph(words)
  paragraph = []
  10.times { paragraph << words.sample(10).join(" ").capitalize + "." }
  return paragraph.join(" ")
end

def wrap_text(paragraph)
  line = ""

  paragraph.split(" ").each do |word|
    new_length = line.length + word.length + 1

    if line.length <= 80 && new_length > 80
      print line + "\n"
      line = word + " "
    else
      line += word + " "
    end
  end

  print line + "\n"
end

def generate()
  all_words = []

  loop do
    Dir.entries('.').each do |file|
      if File.extname(file) == '.txt'
        input = File.read(file)
        input.split(/\s/).each { |word| all_words << word.gsub(/\W/, "").downcase }
        all_words.delete("")
        paragraph = build_paragraph(all_words)
        wrap_text(paragraph)
        File.delete(file)
      end
    end
  end
end

generate()