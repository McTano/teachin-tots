helpers do
  def game
    session[:game] || session[:game] = Game.new
  end

  def question_number
    game.question_number
  end

  def answered_correctly?
    game.current_question.correct?(params[:choice_index].to_i)
  end
end

before '/*' do
  @game = game
end

get '/' do
  session.clear
  erb :index
end

get '/play' do
  erb :"play/index"
end

post '/play' do

  # if params[:choice_index].nil? && params[:button] == ""
  #   flash[:info] = "You need to make a choice"
  # end

  unless params[:next] == 'true'
    #if choice of an answer is passed in params and the choice is correct set border to green otherwise to red
    if answered_correctly?
      @border_color = 'green'
      flash[:info] = "You nailed it!"
    elsif params[:choice_index]
      @border_color = 'red'
      flash[:info] = "Oops... Try again!"
    end

    #increment number of attemps | record the choice of the previous answer
    if params[:choice_index]
      game.increment_tries
      @previous_answer = params[:choice_index].to_i
    end
  else
    game.next_question
    redirect '/end' unless game.current_question
  end

  if request.xhr?
    erb :'play/index', layout: false
  else
    erb :'play/index'
  end

end

get '/end' do
  erb :'end/index'
end