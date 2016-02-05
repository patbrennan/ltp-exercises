#Expanded english number - through millions
def english_number(number)
  
  if number < 0
    return "Please enter a number that isn't negative."
  end
  if number == 0
    return "zero"
  end
  
  num_string = "" # string to edit
  
  ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  teens = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = ["ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  
  # left is how much of the number we still have left to write out
  # write is the part we are writing out right now.
  left = number
  
  write = left/1000000         # how many millions left?
  left = left - write*1000000  # subtract those off
  
  if write > 0
    millions = english_number(write)
    num_string = num_string + millions + " million"
    if left > 0
      num_string += " "
    end
  end
  
  write = left/1000         # how many thousands left?
  left = left - write*1000  # subtract those off
  
  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + " thousand"
    if left > 0
      num_string += " "
    end
  end
  
  write = left/100          # how many hundreds left?
  left = left - write*100   # subtract off those hundreds
  
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + " hundred"
    if left > 0
      num_string += " "
    end
  end
  
  write = left/10         # how many tens left?
  left = left - write*10  # subtract off those tens
  
  if write > 0
    if ((write == 1) and (left > 0))
      # make special exception since we can't write "tenty-two"
      num_string += teens[left-1]   # because teens[3] is fourteen, not thirteen
      left = 0                      # took care of digit in ones place, nothing left to write
    else
      num_string += tens[write-1]   # because tens[3] is fourty, not thirty
    end
    
    if left > 0
      num_string += "-" # so we don't write 'sixtyfour'
    end
  end
  
  write = left      # how many ones left to write out?
  left = 0          # subtract off those ones.
  
  if write > 0
    num_string += ones[write-1]   # because ones[3] is four, not three
  end
  
  num_string  # return the string
end

p english_number(18424315)

#ninety-nine bottles of beer, written out instead of numbers.

def beer_bottles(beer)

  while beer > 0
    p english_number(beer) + " bottles of beer on the wall, " + english_number(beer) + " bottles of beeeeeer." + 
    " Take one down, pass it around. " + english_number(beer-1) + " bottles of beer on the wall."
    
    beer -= 1
  end
end

beer_bottles(9999)