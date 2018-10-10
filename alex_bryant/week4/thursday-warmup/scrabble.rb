# Scrabble Score
# Write a program that, given a word, computes the scrabble score for that word.
#
# scrabble("cabbage")
# # => 14
# Your program should be in a file named scrabble.rb. You should be able to compute the score for any word entered by the user.
#
# Letter Values
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Extensions
# You can play a :double or a :triple letter.
# You can play a :double or a :triple word.

#Method to store the scores hash
$scores = {}
#Method to load the scores hash
def add_scores letters, score
  letters.each do |l|
    $scores[l] = score
  end
end

#Load the score values into the hash
add_scores %w{A E I O U L N R S T}, 1
add_scores %w{D G}, 2
add_scores %w{B C M P}, 3
add_scores %w{F H V W Y}, 4
add_scores %w{K}, 5
add_scores %w{J X}, 8
add_scores %w{Q Z}, 10

def calc_score word, dble_let, trip_let, dble_word, trip_word
  score = 0
  let_weight = 1
  word.upcase.chars.each do |letter|
    if letter == dble_let
      let_weight = 2
    elsif letter == trip_let
      let_weight = 3
    end
    score += $scores[letter] * let_weight
    let_weight = 1
  end
  score * dble_word * trip_word
end

#Loop to play the game
loop do
  puts "Enter your scrabble word: "
  word = gets.chomp
  puts "Play a double letter (or leave blank)"
  dble_let = gets.chomp.upcase
  puts "Play a triple letter (or leave blank)"
  trip_let = gets.chomp.upcase
  puts "Are you playing a double word? (y/n)"
  dble_word = 1
  if (gets.chomp.downcase == "y")
    dble_word = 2
  end
  trip_word = 1
  if dble_word == 1
    puts "Are you playing a triple word? (y/n)"
    if (gets.chomp.downcase == "y")
      trip_word = 3
    end
  end
  score = calc_score word, dble_let, trip_let, dble_word, trip_word
  puts "Your score is #{score}"
end
