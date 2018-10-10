=begin
Scrabble Score
Write a program that, given a word, computes the scrabble score for that word.

scrabble("cabbage")
# => 14
Your program should be in a file named scrabble.rb. You should be able to compute the score for any word entered by the user.

Letter Values
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
Extensions
You can play a :double or a :triple letter.
You can play a :double or a :triple word.
=end

def scrabble_score(word)
  scores = {
    :a => 1,
    :b => 3,
    :c => 3,
    :d => 2,
    :e => 1,
    :f => 4,
    :g => 2,
    :h => 4,
    :i => 1,
    :j => 8,
    :k => 5,
    :l => 1,
    :m => 3,
    :n => 1,
    :o => 1,
    :p => 3,
    :q => 10,
    :r => 1,
    :s => 1,
    :t => 1,
    :u => 1,
    :v => 4,
    :w => 4,
    :x => 8,
    :y => 4,
    :z => 10,
  }

  total_score = 0

  word.downcase.each_char do |letter|
    total_score += scores[letter.to_sym]
  end

  puts total_score
end

def word_score(word)
  scrabble_letters = {
    1 => %w{A E I O U L N R S T},
    2 => %w{D G},
    3 => %w{B C M P},
    4 => %w{F H V W Y},
    5 => %w{K},
    8 => %w{J X},
    10 => %w{Q Z}
  }

  score = 0

  word.upcase.each_char do |letter|
    scrabble_letters.each do |key, value|
      if scrabble_letters[key].include?(letter)
        score += key
      end
    end
  end

  puts score

end

scrabble_score('cabbage')
scrabble_score('Hannah')
scrabble_score('AAA')
puts "--------"
word_score('cabbage')
word_score('Hannah')
word_score('AAA')
