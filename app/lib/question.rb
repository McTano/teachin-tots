class Question

  attr_reader :choices

  def initialize
    @word = "cat"
    @correct_img = "http://i.imgur.com/H10X3rQ.jpg"
    @dummy_1 = "http://i.imgur.com/PuLsUZI.jpg"
    @dummy_2 = "http://i.imgur.com/rCoolmO.jpg"
    @choices = [@correct_img, @dummy_1, @dummy_2].shuffle
  end

  def correct?(index)
    @choices[index] == @correct_img
  end

end