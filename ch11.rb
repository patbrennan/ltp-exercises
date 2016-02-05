#playing with YAML

require 'yaml'

test_array = ['string', 'string', true, 45, '45']
another_array = [{key1: 'value', key2: 41, key3: false, key4: nil}, {key1: 'value2', key2: 22, key3: true, key4: nil}]

test_string = test_array.to_yaml
another_string = another_array.to_yaml

filename = "YAML.txt"

File.open filename, "w" do |f|
  f.write test_string
  f.write another_string
end

read_string = File.read filename

read_array = YAML::load read_string

puts(read_string)
puts(read_array)

#Safer Picture Downloading

Dir.chdir "C:/Documents and Settings/Katy/PictureInbox"

# First find all of the pictures to be moved
pic_names = Dir["F:/**/*.jpg"]

puts "What would you like to call this batch?"
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files:  "

# This will be the counter. We'll start at 1 today, though normally I like to 
# count from 0.
pic_number = 1

pic_names.each do |name|
  print "." #This is our "progress bar"
  
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end
  
  # This renames the pictures, but since "name" has a big long path on it, 
  # and "new_name" doesn't, it also moves the file to the current working directory,
  # which is now Katy's pictureInbox folder. Since it's a 'move', this effectively
  # downloads and deletes the originals. And since this is a memory card, not a 
  # hard drive, each of these takes a second or so; hence, the little dots let her
  # know that my program didn't hose her machine.
  
  if File.exist?(new_name)
    exit("#{new_name} already exists.")
  else
      File.rename(name, new_name)
  end
  pic_number += 1     # increment the counter
end

puts
puts "Finished!"