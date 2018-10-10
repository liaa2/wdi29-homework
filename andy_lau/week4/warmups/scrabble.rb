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

print "What is your scrabble word?: "
word = gets.chomp.upcase

# my soln:
def scrabble(word)
  letter_scores = {
    "A": 1,
    "E": 1,
    "I": 1,
    "O": 1,
    "U": 1,
    "L": 1,
    "N": 1,
    "R": 1,
    "S": 1,
    "T": 1,

    "D": 2,
    "G": 2,

    "B": 3,
    "C": 3,
    "M": 3,
    "P": 3,

    "F": 4,
    "H": 4,
    "V": 4,
    "W": 4,
    "Y": 4,

    "K": 5,

    "J": 8,
    "X": 8,

    "Q": 10,
    "Z": 10,
  }

  score = 0

  # word.split('').each do |el|
  #   letter_scores.each do |letter, value|
  #     if el == letter.to_s
  #       score = score + value.to_i
  #     end
  #   end
  # end

  word.upcase.chars.each do |letter|
    score += letter_scores[letter].to_i
  end
  score

  puts score

end

scrabble(word)

# def calc_score(word)
#   scrabble_letters = {
#     1 => %w{A E I O U L N R S T },
#     2 => %w{D G},
#     3 => %w{B C M P},
#     4 => %w{F H V W Y},
#     5 => %w{K},
#     8 => %w{J X},
#     10 => %w{Q Z},
#   }
#
#   score = 0
#
#   word.chars.each do |letter|
#     scrabble_letters.each do |key, value|
#       if scrable_letters[key].include?(letter)
#         score += key
#       end
#     end
#   end
#
#   score
#
#
# end
