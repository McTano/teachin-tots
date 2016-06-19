class Game

  NUMBER_OF_QUESTIONS = 10.0

  attr_reader :question_number, :current_question

  def initialize(category=nil)
    @category = category
    @question_number = 1
    @current_question = Question.new(@category)
    @tries = 0
  end

  def next_question
    if @question_number < NUMBER_OF_QUESTIONS
      @current_question = Question.new(@category)
      @question_number += 1
    else
      @current_question = nil
    end
  end

  def answer_options
    current_question.choices
  end

  def increment_tries
    @tries += 1
  end

  def score
    ((NUMBER_OF_QUESTIONS / @tries) * 100).to_i
  end
end
