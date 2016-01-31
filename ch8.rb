#return sorted array when user hits enter

words = []
puts "Enter your words"
input = gets.chomp.to_s.downcase

until input == ""
  words.push input
  input = gets.chomp.to_s.downcase
end

if input == ""
  puts words.sort
end
