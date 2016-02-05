#one billion seconds
born = Time.local(1985, 6, 22, 3, 30)
puts born
billion = born + 1000000000
puts billion

#Happy Birthday
puts "What year were you born?"
year = gets.chomp
puts "What month?"
month = gets.chomp
puts "What was the date of the month?"
day = gets.chomp

birthday = Time.local(year, month, day)
age = ((Time.new - birthday) / 31536000).floor #seconds in a year
puts "Wow, you're #{age} years old!"

age.times do |i|
  puts "SPANK ##{i+1}!"
end

