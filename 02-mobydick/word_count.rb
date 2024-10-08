# Open a file from the command line

filename = ARGV[0]
if !filename
  puts "Usage: ruby word_count.rb <filename>"
end

# read a stop_words array from a file

stop_words = []

File.open("stop_words.txt", "r") do |f|
  f.each_line do |line|
    stop_words << line.chomp
  end
end

dictionary = {}

f = File.open(filename, "r")
text = f.read
f.close
# Split the text into words avoiding punctuation
words = text.split.reject { |word| word =~ /[[:punct:]]/ }

words.each do |word|
  word = word.downcase
  #next if stop_words.include?(word)

  dictionary[word] ||= 0
  dictionary[word] += 1
end

dictionary.sort_by { |word, count| count }.reverse.each do |word, count|
  puts "#{word},#{count}"
end