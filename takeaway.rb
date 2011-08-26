#
# Take Away Game v0.1
#
# Author:      Daniel Puglisi
# Description: Take Away is a simple singleplayer console game. Your enemy is the CPU. You 
#              start with a random number of coins and have to take one, two or three coins out. 
#              Then it's CPU's turn. CPU takes one, two or three. Then it's your turn. 
#              This goes on as long you or the CPU can take the last coin out. 
#              The player who can take out the last coin, wins the game.
#

# A prompt function for the results
def prompt(amount)
  puts ">>\t #{amount}"
  puts "-----------"
end

# Evaluates the winner
def winner(number, message)
  # If the start number is 0, we have a winner
  if number == 0
    # print out a message and close the game
    puts "#{message}"
    Process.exit(0)
  end
end

def human?
  # If the turn index is even, it is the player's turn, else the cpu's turn
  @turn_index % 2 == 0
end

def turn(turn_number)
  if human?
    # Player turn
    player_turn = true
    # Check if it's player's turn
    while player_turn
      # Print out prompt and get player input
      print "Player:\t ";user_number = gets.chomp.to_i
      # Check if the input was valid
      if (1..3).include? user_number
        # Substract player number from turn number
        turn_number -= user_number
        player_turn = false # Breaks the while-loop, break is an alternative
      else
        # Print out a error message
        puts "Choose between 1, 2 or 3 coins"
      end
    end
  else
    # CPU turn
    cpu_number = turn_number % 4
    # If modulo is 0, take a random number
    if cpu_number == 0
      # Get a random number
      cpu_number = 1 + rand(3)
    end
    
    # Substract cpu number from turn number
    turn_number -= cpu_number
    # Print out NPC's turn
    puts "NPC:\t #{cpu_number}"
  end
  # Print out the turn number
  prompt(turn_number)
  # If there is a winner, print it out
  winner(turn_number, human? ? "YYYYYAAAAAAAAAYYYYY WINNER!!! *%&!VC&/=+!!!" : "You lose! CPU is the best ;D")
  # return the turn number
  turn_number
end

# Let's play
def play(start_number)
  # We start with the start number
  turn_number = start_number
  # This is the turn index, it evaluates if it's the player's or the cpu's turn
  @turn_index = 0
  # Play as long the start number is less than 1
  while start_number >= 1
    # Starts a new turn and gets the number
    turn_number = turn(turn_number)
    # Increases the turn index by 1
    @turn_index += 1
  end
end

# Starts the game
def start
    # The player has to choose with which number he wants to start
    # print "Please choose a number to start: "; start_number = gets.chomp.to_i
  # The game starts with a random number between 30 and 99
  start_number = rand(10) + rand(10) + rand(10) + rand(10) + 4
  prompt(start_number)
  # Let's play
  play(start_number)
end

# Starts the game
start()