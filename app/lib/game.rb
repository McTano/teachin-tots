class Game

  attr_reader :id

  @@games = []

  def self.find(id)
    @@games[id]
  end

  def initialize
    @@games << self
    @id = @@games.length - 1

    # creates the question set for this game.
    @questions = []
    10.times { @questions << Question.new }
    
    @current_question_index = 0
  end

  # if current_question returns nil, then we have
  # reached the end of the game.
  def current_question
    @questions[@current_question_index]
  end

  def next_question
    @current_question_index += 1
  end

end