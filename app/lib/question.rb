class Question

  attr_reader :choices

  def initialize
    @word = "cat"
    @correct_img = "http://imgur.com/H10X3rQ"
    @dummy_1 = "http://i.imgur.com/A2CL0Ah.jpg"
    @dummy_2 = "http://imgur.com/gallery/rCoolmO"
    @choices = [@correct_img, @dummy_1, @dummy_2].shuffle
  end

  def correct?(index)
    @choices[index] == @correct_img
  end

end