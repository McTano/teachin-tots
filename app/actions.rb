helpers do
  def start_game
    session[:game] = Game.new
  end
end

get '/' do
  session.clear
  erb :index
end

post '/play' do
  #set game to current game via session

  unless params[:button] == 'next'
    #if choice of an answer is passed in params and the choice is correct set border to green otherwise to red
    if params[:choice_index] && @game.current_question.correct?(params[:choice_index].to_i)
      @border_color = 'green'
    else 
      @border_color = 'red'
    end
    #record the choice of the previous answer to an instance variable to pass on to play/index.erb
    @game.increment_tries
    @previous_answer = params[:choice_index].to_i
  else
    @game.next_question
    redirect '/end' unless @game.current_question
  end

  erb :'play/index'
end

get '/play' do
  @game = start_game
  erb :'play/index'
end

get '/end' do
  @game = session[:game]
  erb :'end/index'
end