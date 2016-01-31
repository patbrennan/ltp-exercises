#Create own sort method, once regularly & then recursively

words = ["this", "that", "Patrick", "Svetlana", "USA", "aviation", "that"]

def sort_arr(array, sorted_array=[])
  
  while array != []
    smallest = array.min
    sorted_array.push(smallest)
    array.delete_at(array.index(array.min))
  end
  p sorted_array
end

p sort_arr(words)
p words.sort

#trying recursive (my version)
def sort_r(array, sorted_array=[])

  if array != []
    sorted_array.push(array.min)
    array.delete_at(array.index(array.min))
    sort_r(array, sorted_array)
  end

  sorted_array
end

p sort_r(words)

#working stack answer:
words = ["this", "that", "Patrick", "Svetlana", "USA", "aviation", "that"]

def sort_r(array, sorted_array=[])
  sorted_array << array.delete_at(array.index(array.min))
  sort_r(array, sorted_array) unless array.size.zero?
  sorted_array
end

p sort_r(words)

#Shuffle
ordered = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def shuffle(array, shuffled_arr=[])
  shuffled_arr << array.delete_at(rand(array.length))
  shuffle(array, shuffled_arr) unless array.size.zero?
  shuffled_arr
end

p shuffle(ordered)
#=> [3,4,6,10,1,8,2,9,5,7]

#Dictionary sort - must sort like a dictionary & return strings exactly as found.
words = ["this", "that", "Patrick", "Svetlana", "USA", "aviation", "that"]

def dictionary(array, sorted_array=[])
  downcased = array.map { |word| word.downcase }              
  
  sorted_array << array.delete_at(downcased.index(downcased.min)) 
  dictionary(array, sorted_array) unless array.size.zero?
  
  sorted_array
end

p dictionary(words)
#=> ["aviation","Patrick","Svetlana","that","that","this","USA"]

# downcase each string in the array, put into new array. 
# find the lowest value in new array, add the value at that index in old array to sorted array
# and delete that value in old array
# recursively so that if the array is not empty