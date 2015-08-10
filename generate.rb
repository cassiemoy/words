def build_paragraph(words)
  paragraph = []
  10.times { paragraph << words.sample(10).join("\s").capitalize + "." }
  return paragraph.join(" ")
end

def wrap_text(paragraph)
  line = ""

  paragraph.split(/\s/).each do |word|
    new_length = line.length + word.length + 1

    if line.length <= 80 && new_length > 80
      print line + "\n"
      line = word + "\s"
    else
      line += word + "\s"
    end
  end

  print line + "\n"
end

def generate()
  all_words = []

  loop do
    Dir.entries(".").each do |file|
      if File.extname(file) == ".txt"
        input = File.read(file)
        
        input.split(/\s/).each do |word| 
          all_words << word.gsub(/\W/, "").downcase if word != ""
        end
        
        wrap_text(build_paragraph(all_words))
        File.delete(file)
      end
    end
  end
end

generate()