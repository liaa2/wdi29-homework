=begin
1 Create a class which accepts an input
2 Create an 'encode' method which take the input
(obtained in (1) above) and rebuilds it with the reverse alphabet
=end

class Atbash
  # Create an initialize method. This will be called whenever the .new  method is called on the Atbash class.
  # Since I want to pass in a word to be en/coded when I instantiate a new Atbash object, my initialize method also needs to accept an argument (whatever gets passed in when I call Atbash.new()).
  def initialize(input)
    # My initialize method is going to set up all the instance variables I'll need in my encode method.
    @word = input.downcase
    # Create a new range of all the characters between "a" to "z" and then convert that to an array.
    @alphabet = ("a".."z").to_a
    # Create another array that is just the reverse alphabet array.
    @reverse = @alphabet.reverse
  end

  def encode
    message = ""

    # Call a method on the @word string that will return an array
    # few ways
    # @word.split("").each |letter|
    # @word.chars.each do |letter|
    # @word.each_char do |letter|
      # index = @alphabet.index(c)
    # end

    @word.each_char do |letter|

      #find where each letter appears in the normal alphabet
      index = @alphabet.index(letter)

      #use that index on the reverse alphabet
      cipher_character = @reverse[index]

      #build out the message adding all of the individual letters together
      message << cipher_character
    end #loop

    message
  end
end

puts "What's your secret word?"
word = gets.chomp

cipher = Atbash.new(word)
puts cipher.encode
