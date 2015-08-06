# read text from file in directory

Dir.entries(".").each do |i|
  if File.extname(i) == ".txt"
    p i
    p "is text"
  end
end