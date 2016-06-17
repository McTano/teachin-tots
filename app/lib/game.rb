class Game

  NUMBER_OF_QUESTIONS = 10

  def initialize
    # creates the question set for this game.
    @questions = []
    NUMBER_OF_QUESTIONS.times { @questions << Question.new }
    
    @current_question_index = 0
    @tries = 0
  end

  # if current_question returns nil, then we have
  # reached the end of the game.
  def current_question
    @questions[@current_question_index]
  end

  def number_of_current_question
    @current_question_index + 1
  end

  def next_question
    @current_question_index += 1
  end

  def increment_tries
    @tries += 1
  end

  def score
    ((NUMBER_OF_QUESTIONS.to_f / @tries) * 100).to_i
  end
end
