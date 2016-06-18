class Question


  CATEGORIES = ["philosophers", "artworks", "animals", "writers", "hollywood"]

  attr_reader :choices, :word

  def initialize(category)
    category ||= CATEGORIES.sample
    sample = Concept.where("category = '#{category}'").order("RANDOM()").limit(3)
    @word = sample[0][:word]
    @correct_image = sample[0][:image]
    @choices = [@correct_image, sample[1][:image], sample[2][:image]].shuffle
  end

  def correct?(index)
    @choices[index] == @correct_image
  end
end