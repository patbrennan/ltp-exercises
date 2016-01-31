#improved ask method
#old:
def ask question
  while true
    puts question
    reply = gets.chomp.downcase
    
    if (reply == "yes" || reply == "no")
      if reply == "yes"
        answer = true
      else
        answer = false
      end
      break
    else
      puts "Please answer 'yes' or 'no'."
    end
  end
  
  answer
end
#new:
def ask_v2 question
  while true
    puts question
    reply = gets.chomp.downcase
    
    if (reply == "yes" || reply == "no")
      if reply == "yes"
        return true
      else
        return false
      end
      break
    else
      puts "Please answer 'yes' or 'no'."
    end
  end
end

#old-school roman numerals
I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

# 3452 / 1000 = 3, or M*3
# 3452 % 1000 % 100 = 4, or C*4
# 3452 % 1000 % 100 % 10 = 5, or X

def old_roman
  puts "Enter a number:"
  num = gets.chomp.to_i
  result = ""
  
  result += "M" * (num / 1000)
  
  if (num % 1000 / 500) > 0
    result += "D" * (num % 1000 / 500)
    result += "C" * ((num % 1000 / 100) - 500)
  else
    result += "C" * (num % 1000 / 100)
  end
  
  if (num % 1000 % 100) >= 50          #3467 = 67 >= 50, true
    result += "L"
    result += "X" * ((num % 1000 % 100 / 10) - 5) #3467, 467, 67, 6, -5 = 1
  else
    result += "X" * (num % 1000 % 100 / 10)
  end
  
  if (num % 1000 % 100 % 10) >= 5         #3467 = 7 >= 5, true
    result += "V"
    result += "I" * ((num % 1000 % 100 % 10) - 5) #3467, 467, 67, 7, -5 = 2
  else
    result += "I" * (num % 1000 % 100 % 10)
  end
  
  puts result
end

old_roman

# def old_roman2 num
#   i = 
#   v = 
#   x = 
#   l = 
#   c = 
#   d = if ((num % 1000 % 100) - 5) > 0
#         "D" * (num % 1000 % 100) - 5
#       else
#         ""
#       end
#   m = "M" * num % 1000
  
#   result = m + d + c + l + x + v + i
#   puts result
# end

#modern roman numerals
# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000

# Similar to above, I would write conditionals so if the modulus is equal to
# 900, 90, 9, 400, 40, or 4, it would add the

num = 3989

thousands = num / 1000         #3
hundreds = num % 1000 / 100    #9
tens = num % 1000 % 100 / 10   #8
ones = num % 1000 % 100 % 10   #9

roman = ""

if thousands > 0
  roman += "M" * thousands
elsif hundreds > 0
  if hundreds == 9
    roman += "DM"
  elsif hundreds == 4
    roman += "CD"
  elsif hundreds == 5
    roman += "C"
  elsif hundreds >
    roman += "uuuu"
  end
else
end
