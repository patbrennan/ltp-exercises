#Orange tree

class OrangeTree
  def initialize
    @age = 0
    @height = 0.1
    @oranges = 0
  end
  
  def one_year_passes
    @age += 1
    
    if dead?
      puts "Your tree is #{@age} yrs old. It DIED! (sniff)"
      @oranges = 0
      count_oranges
      exit
    elsif @age >= 2 && @age < 4
      @oranges += 2
      @height += 1.5
      puts "Your tree grew! It's #{@age}yrs old."
    elsif @age > 2
      @oranges += 3
      @height += 1.5
      puts "Your tree grew! It's #{@age}yrs old."
    end
    
    height
    count_oranges
  end
  
  def height
    puts "Your tree is #{@height} feet tall."
  end
  
  def count_oranges
    puts "Your tree has #{@oranges} oranges to pick."
  end
  
  def pick_orange
    if @oranges == 0
      puts "There aren't any oranges on the tree!"
    else
      puts "MMmmmm...delicious orange!"
      @oranges -= 1
      count_oranges
    end
  end
  
  private
  
  def dead?
    @age > 5
  end
  
end

tree = OrangeTree.new
tree.height
tree.count_oranges
tree.pick_orange
tree.one_year_passes
tree.count_oranges
tree.one_year_passes
tree.pick_orange
tree.one_year_passes
tree.one_year_passes
tree.pick_orange
tree.pick_orange
tree.one_year_passes
tree.pick_orange
tree.one_year_passes