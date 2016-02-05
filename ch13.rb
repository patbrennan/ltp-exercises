#extend built-in methods

ordered = [1,2,3,4,5,6,7,8,9,10]

class Array
  def shuffle(shuffled_arr=[])
    shuffled_arr << self.delete_at(rand(self.length))
    shuffle(shuffled_arr) unless self.size.zero?
    shuffled_arr
  end
end

puts ordered.shuffle

class Integer           # not working, wrong number of arguments
  def factorial
    if self <= 1
      1
    else
      self * (self - 1).factorial
    end
  end
end

puts 12.factorial