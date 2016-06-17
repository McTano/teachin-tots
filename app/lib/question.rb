class Question

  attr_reader :choices, :word

  def initialize
    @sample = Concept.order("RANDOM()").limit(3)
    @word = @sample[0][:word]
    @correct_image = @sample[0][:image]
    @dummy_1 = @sample[1][:image]
    @dummy_2 = @sample[2][:image]
    @choices = [@correct_image, @dummy_1, @dummy_2].shuffle
  end

  def correct?(index)
    @choices[index] == @correct_image
  end

end