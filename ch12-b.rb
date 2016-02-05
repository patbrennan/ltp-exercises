#party like it's roman_to_integer

# def roman_to_integer
#   # romans = ["m", "d", "c", "l", "x", "v", "i"]
#   values = { "m"=>1000, "d"=>500, "c"=>100, "l"=>50, "x"=>10, "v"=>5, "i"=>1 }
  
#   puts "Enter a Roman numeral:"
#   str = gets.chomp.downcase
#   num = 0
#   i = 0
  
#   while i < str.length          # This doesn't not operate properly, need to know why
#       if str[i] =~ /[mdclxvi]/
#         i += 1
#       else
#         puts "You entered a non-Roman character."
#         roman_to_integer
#       end
#   end
  
#   # Got stuck trying to figure out how to total up each letter based on numbers
#   # when the case is that it's a 9, 4, 90, 900, 40, etc.
  
#   puts "#{str} = #{num}"
    
# end

# roman_to_integer

def roman_to_integer(roman)
  values = { "m"=>1000, "d"=>500, "c"=>100, "l"=>50, "x"=>10, "v"=>5, "i"=>1 }
  total = 0
  prev = 0
  index = roman.length - 1
  
  while index >= 0
    c = roman[index].downcase
    index -= 1
    val = values[c]
    
    if !val
      puts "This is not a valid Roman numeral"
      return
    end
    
    if val < prev
      val = val * -1
    else
      prev = val
    end
    
    total += val
  end
  
  total
end

p roman_to_integer("mcdxiv")

#birthday helper
def bday
  bdays = File.read "bdays.txt"   # create string from text file
  list = {}                       # hash to store people: bday
  months = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]   # for referencing a month number later
  
  bdays.each_line do |line|           # take each line of file, add to dates hash from it.
    i = line.index(",")               # find index of first comma in each line
    person = line[0...i].downcase     # person = string @ 0 index to before the first comma. (... = non-inclusive)
    date = line[(i+1)..line.length]   # date = from the index of the comma to the end of the string (.. = inclusive)
    list[person] = date.strip.chomp   # Take the string of the name (from 0 to i-1) & assign it's value to the string of the date, stripped (no leading / trailing spaces)
  end
  
  puts "Enter a name:"
  name = gets.strip.downcase.chomp         # get the name 
  
  if list.has_key?(name)
    i = list[name].index(",")                   # find the index of the comma, for reference
    month_name = list[name][0...3].downcase     # store the first 3 chars in month_name, downcased
    month_num = months.index(month_name) + 1    # get the month number using months array
    day = list[name][i-2...i].strip.to_i        # get the date number referencing the comma, up to but not including comma, and convert to Integer
    year = list[name][i+1..list[name].length].strip.to_i    # get the year & convert to integer
    
    now = Time.new                              # get current time
    birthday = Time.local(year, month_num, day) # convert birthday to time instance
    age = ((now - birthday) / 31536000).floor   # find age in seconds, then divide by seconds/year to get years
    next_bday_yr = 0
    message = "Shiiiiiit..."
    
    if now.month <= birthday.month      # will test to see if next_bday_yr is this year or next
      if now.day < birthday.day
        next_bday_yr = now.year
      elsif now.day == birthday.day
        message = "Happy Birthday!!!"   # change the message to happy bday if it's today.
        next_bday_yr = now.year
      else
        next_bday_yr = now.year + 1
      end
    else
      next_bday_yr = now.year + 1
    end
    
    puts "#{name.capitalize} is #{age}. Birthday: #{list[name]}. Next Birthday: #{months[birthday.month-1].capitalize} #{birthday.day}, #{next_bday_yr}. Will be #{age+1}! #{message}"
  else
    puts "That person does not exist. Please type the full name of someone in the list."
  end
  
end

bday()
  