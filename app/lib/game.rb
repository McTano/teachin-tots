class Game

  @@games = []

# TEST
  attr_reader :id
  
  def initialize
    @@games << self
    @id = @@games.length - 1
  end

  def current_question
    self
  end
  
  def choices
      ["https://img.buzzfeed.com/buzzfeed-static/static/2014-04/enhanced/webdr03/4/16/enhanced-26552-1396642701-1.jpg?no-auto",
        "https://img.buzzfeed.com/buzzfeed-static/static/2014-04/enhanced/webdr06/4/16/enhanced-11136-1396643149-13.jpg?no-auto",
        "https://img.buzzfeed.com/buzzfeed-static/static/2014-04/enhanced/webdr06/9/14/enhanced-631-1397069470-19.jpg?no-auto"
      ]
  end

  def self.find(id)
    @@games[id]
  end


# END OF TEST CODE

end

puts Game.new.current_question.choices