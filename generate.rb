def build_paragraph(words)
  paragraph = []
  10.times { paragraph << words.sample(10).join("\s").capitalize + "." }
  return paragraph.join("\s")
end

def wrap_text(paragraph, limit)
  output = []
  line = ""
  paragraph.split(/\s/).each do |word|
    while word.length > limit
      line = word.slice!(0..(limit - 1))
    end
    
    new_length = line.length + word.length + 1

    if line.length <= limit && new_length > limit
      output << line
      line = word + "\s"
    else
      line += word + "\s"
    end
  end

  output << line
  return output
end

def print_text(output, limit)
  output.each do |line|
    # print center_text(line, limit) + "\n"
    # print right_align_text(line, limit) + "\n"
    print line + "\n"
  end
end

def center_text(line, limit)
  spaces = limit - line.length
  line = "\s" * (spaces/2) + line + "\s" * (spaces/2)
  return line
end 

def right_align_text(line, limit)
  spaces = limit - line.length
  line = "\s" * spaces + line
  return line
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
        
        limit = 40
        output = wrap_text(build_paragraph(all_words), limit)
        print_text(output, limit)
        File.delete(file)
      end
    end
  end
end

generate()