
class Cipher
  attr_accessor :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a
  end

  def change_string(string)
    changed_string = ""

    string.chars.each do |letter|
      if @alphabet.include?(letter)
        index = @alphabet.find_index(letter)
        reverse_index = (index + 1) * -1
        changed_string << @alphabet[reverse_index]
      else
        changed_string << letter
      end
    end

    changed_string
  end

  def encode(string)
    puts change_string(string)
  end

  def decode(string)
    puts change_string(string)
  end
end

c = Cipher.new
c.encode('test')
c.decode('gvhg')
c.decode('howdy doody!')
c.decode('gsrh rh z hvxivg nvhhztv gszg droo yv vmxlwvw uli blf gl wvxlwv. gfitov.')
c.encode('who turgled?')
