def words
  ['backpack', 'ham', 'car', 'bike']
end

def max_lives
  3
end

def print_word(word)
  puts word.chars.join(' ')
end

def status(word, lives)
  print_word(word)
  puts 'You have ' + lives.to_s + ' more lives'
  puts 'Input a letter'
end

def random_word(words)
  idx = Random.rand(words.size)
  words[idx]
end

def hidden(word)
  '_' * word.size
end

def replace(letter, word, solution)
  n = word.size
  (0..n).each do |idx|
    if solution[idx] == letter
      word[idx] = letter
    end
  end
end

def won(word)
  !word.include?('_')
end

def game
  solution = random_word(words())
  puts solution
  word = hidden(solution)
  lives = max_lives()

  while lives != 0 && !won(word)
    status(word, lives)
    letter = gets.chomp
    if (solution.include?(letter))
      replace(letter, word, solution)
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
