beer = 99

while beer > 0
  less_beer = beer - 1
  p "#{beer} bottles of beer on the wall, #{beer} bottles of beeeeeer." + 
  " Take one down, pass it around. #{less_beer} bottles of beer on the wall."
  beer -= 1
end

puts "-----------"
#grandma program
bye = 0
#Only requires BYE once
# while input != "BYE"
#   input = gets.chomp
#   if input == input.upcase
#     puts "NO, NOT SINCE " + (rand(21) + 1930).to_s
#   else
#     puts "HUH?! SPEAK UP, SONNY!"
#   end
# end
#Requires BYE three times in a row
while bye < 3
  input = gets.chomp
  if input != "BYE"
    bye = 0
  end
  
  if input == "BYE"
    bye += 1
    puts "NO, NOT SINCE " + (rand(21) + 1930).to_s
  elsif input == input.upcase
    puts "NO, NOT SINCE " + (rand(21) + 1930).to_s
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end

#leap years program
puts "Enter a starting year."
start_yr = gets.chomp.to_i
puts "Enter an ending year."
end_yr = gets.chomp.to_i
yr = start_yr

while yr <= end_yr
  if (yr % 4 == 0)
    if (yr % 100 == 0) && !(yr % 400 == 0)
      #do nothing
    else
      puts yr
    end
  end
  yr += 1
end