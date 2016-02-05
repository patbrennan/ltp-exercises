#Interactive baby dragon
class Dragon
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0
    
    puts "#{@name} is born."
  end
  
  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end
  
  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end
  
  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
      if @asleep
        @asleep = false
        puts "#{@name} wakes up slowly."
      end
  end
    
  def toss
    puts "You rock him gently."
    puts "He giggles, which singes your eyebrows."
    passage_of_time
  end
  
  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes when you stop."
    end
  end
  
  private
  
  def hungry?
    @stuff_in_belly <= 2
  end
  def poopy?
    @stuff_in_intestine >=8
  end
  
  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} is starving! In desperation, he ate YOU!"
      exit
    end
    
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name}'s stomach grumbles."
    end
    if poopy?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly..."
      end
      puts "#{@name} does the potty dance."
    end
  end
  
end

#program to make interactive

def interactive_dragon
  puts "What would you like to call your dragon?"
  name = gets.chomp
  pet = Dragon.new name
  input = ""
  
  while input != "exit"
    puts "What would you like to do with #{name}? For available commands, type 'h'."
    input = gets.chomp.downcase
    
    case input
    when "feed"
      pet.feed
    when "toss"
      pet.toss
    when "walk"
      pet.walk
    when "bed"
      pet.put_to_bed
    when "rock"
      pet.rock
    when "h"
      puts "Available commands: feed, toss, walk, bed, rock, or exit."
    when "exit"
      exit
    else
      puts "That's not a recognized command. Type 'h' for a list."
    end
  end
end

interactive_dragon