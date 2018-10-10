# Atbash Cipher
# The Atbash cipher is a simple substitution cipher that relies on transposing
# all the letters in the alphabet such that the resulting alphabet is backwards.
# The first letter is replaced with the last letter, the second with the second-last, and so on.
#
# An Atbash cipher for the Latin alphabet would be as follows:
#
# Plain:  abcdefghijklmnopqrstuvwxyz
# Cipher: zyxwvutsrqponmlkjihgfedcba
# It is a very weak cipher because it only has one possible key, and it is a simple monoalphabetic substitution cipher.
# However, this may not have been an issue in the cipher's time.
#
# In Ruby, write a program which seeks a user's input, and encodes/decodes the input.
#
# Examples
# Encoding "test" gives "gvhg"
# Decoding "gvhg" gives "test"

class Cipher
  def initialize
    plain = [*"a".."z"]
    cipher = [*"a".."z"].reverse
    @encode = Hash[plain.zip(cipher)]
  end

  def encode(word)
    output = ""
    word.each_char do |letter|
      output << @encode.values_at(letter).join()
    end
    output
  end
end

word = Cipher.new
puts word.encode("test")
puts word.encode("gvhg")
