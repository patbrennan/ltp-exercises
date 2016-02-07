#Program Logger

def log_this(description, &block1)
  puts "Logging commenced."
  
  puts "Starting: #{description}..."
  result = block1.call
  puts "...Done."
  puts "#{description} returned: "
  p result
  
  puts "Logging finished."
end

log_this "test" do
  5**2**3
end

#solution
def log1(desc, &block)
  puts "Starting #{desc}..."
  result = block.call
  puts "...Done. returning: " + result.to_s
end

log1 "outer block" do
  log1 "some little block" do
    1**1 + 2**2
  end
  
  log1 "yet another" do
    "!desrever saw sihT".reverse
  end
  
  "0" == 0
end

#alternatively
def log2(desc, &block)
  puts "Starting #{desc.inspect}..."
  result = block[]
  puts "...#{desc.inspect} finished, returning: #{result}"
end

#better logger - indentation
$depth = 0   # this is a global variable

def log3(desc, &block)
  indent = "  "*$depth
  
  puts indent + "Starting #{desc.inspect}..."
  $depth += 1
  result = block[]
  $depth -= 1
  puts indent + "...#{desc.inspect} finished, returning: #{result}"
end

log3 "outer block" do
  log3 "2nd block" do
    log3 "3-a block" do
      "This IS rEaLLy StrAngE.".downcase
    end
    
    7*3*2

    log3 "3-b block" do
      "even StrANGEr thAn BeFOre.".downcase
    end
  end
end