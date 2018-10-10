# Atbash Cipher
# The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the alphabet such that the resulting alphabet is backwards. The first letter is replaced with the last letter, the second with the second-last, and so on.
#
# An Atbash cipher for the Latin alphabet would be as follows:
#
# Plain:  abcdefghijklmnopqrstuvwxyz
# Cipher: zyxwvutsrqponmlkjihgfedcba
# It is a very weak cipher because it only has one possible key, and it is a simple monoalphabetic substitution cipher. However, this may not have been an issue in the cipher's time.
#
# In Ruby, write a program which seeks a user's input, and encodes/decodes the input.
#
# Examples
# Encoding "test" gives "gvhg"
# Decoding "gvhg" gives "test"

class Cipher

  attr_accessor :plain

  def get_new_letter let, reverse_code, normal_code
    reverse_code[normal_code.index(let)]
  end

  def cycle_word word, order_of_codes
    new_letters = []
    word.split('').each do |let|
      new_letters.push(get_new_letter let, order_of_codes[0], order_of_codes[1])
    end
    new_letters.join('')
  end

  def encode word
    cycle_word word, [cipher, @plain]
  end

  def decode word
    cycle_word word, [@plain, cipher]
  end

  def initialize normal_code
    @plain = normal_code
  end

  private

  def cipher
    @plain.reverse
  end

end

cipher1 = Cipher.new "abcdefghijklmnopqrstuvwxyz"
puts "Encoding the word 'test' ==> #{cipher1.encode("test")}"
puts "Decoding the word 'gvhg' ==> #{cipher1.decode("gvhg")}"
