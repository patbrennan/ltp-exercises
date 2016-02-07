#profiling code to know run time:

def profile(block_description, &block)
  run = true
  
  if run
    start_time = Time.new
    block.call
    duration = Time.new - start_time
    puts "#{block_description}: #{duration} seconds"
  else
    block.call
  end
end

# profile "Count to 100,000" do
#   num = 0
  
#   while num <= 100000
#     puts num
#     num += 1
#   end
# end

#Grandfather clock

def dong
   a = puts "DONG..."
   a
end

def clock(&block)
  hours = Time.new.hour
  puts hours
  
  hours.times do
    block.call
  end
end

clock do
  puts "DONG..."
end

clock(dong) # - why does this not work?