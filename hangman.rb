# @return [Array] array of available words in the game
def words
  ['backpack', 'ham', 'car', 'bike']
end

# @return [Fixnum] the number of mistakes you can make
def max_lives
  3
end

# Prints the current state of the word with a space between the
# individual letters
#
# @param word [String] the word
def print_word(word)
  puts word.chars.join(' ')
end

# Prints the current status of the game:
# - the word
# - the number of available lives
# - prompts the user to input a letter
#
# @param word [String] the word
# @param lives [Fixnum] the number of lives
def print_status(word, lives)
  print_word(word)
  puts 'You have ' + lives.to_s + ' more lives'
  puts 'Input a letter'
end

# Picks a word which will be the word of the game
#
# @param words [Array] the array of available words
# @return [String] the chosen word
def random_word(words)
  idx = Random.rand(words.size)
  words[idx]
end

# @param word [String] the word of the game
# @return [String] a String of the same length as the input with underscores
# instead of letters
def hidden(word)
  '_' * word.size
end

# Replaces the underscors with the input letter inside the word, in all the
# places where that letter is present in the solution word. It returns the
# word with the added letter
#
# For example:
# replace('a', '____', 'mama')
# => '_a_a'
#
# @param letter [String]
# @param word [String]
# @param solution [String]
# @return [String] the new word
def replace(letter, word, solution)
  n = word.size
  (0..n).each do |idx|
    if solution[idx] == letter
      word[idx] = letter
    end
  end
  word
end

# Returns true if the game has been won
#
# @param word [String] the current state of the word
# @return [Booleab] true/false if the game has/hasn't been won
def won(word)
  !word.include?('_')
end

# This function controlls the flow of the game and it encapsulates the entire
# game logic.
# It returns when the game is over.
# Until the game is over, it needs to read a character from the user and then,
# if the letter is correct, add it to the word, otherwise, the user loses
# a life.
# The game is over when there are no more lives (loss) or when all the letters
# have been found (win).
# It needs to print the game status before each round and, at the end, print
# the outcome of the game
def game
  solution = random_word(words())
  puts solution
  word = hidden(solution)
  lives = max_lives()

  while lives != 0 && !won(word)
    print_status(word, lives)
    letter = gets.chomp
    if (solution.include?(letter))
      word = replace(letter, word, solution)
    else
      lives -= 1
    end
  end

  if lives == 0
    puts 'You lose!'
  else
    puts 'You win!'
  end
end

game()
