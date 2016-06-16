helpers do
  def start_game
    session[:game] = Game.new
  end
end

get '/' do
  session.clear
  erb :index
end

get '/play' do
  @game = start_game
  erb :"play/index"
end

post '/play' do
  @game = session[:game]  
  if params[:choice_index] && @game.current_question.correct?(params[:choice_index].to_i)
    @border_color = 'green'
  else
    @border_color = 'red'
  end
  @previous_answer = params[:choice_index].to_i
  erb :"play/index"
end

get '/play' do
  @game = start_game
  erb :"play/index"
end