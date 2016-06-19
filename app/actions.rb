helpers do
  def game
    session[:game] || session[:game] = Game.new
  end

  def question_number
    game.question_number
  end

  def selected_answer
    params[:choice_index].to_i
  end

  def answered_correctly?
    game.current_question.correct?(selected_answer)
  end
end

before '/*' do
  @game = game
end

get '/' do
  session.clear
  erb :index
end

get '/new_play' do
  session.clear
  redirect '/play'
end

get '/play' do
  erb :"play/index"
end

post '/play' do

  # if params[:choice_index].nil? && params[:button] == ""
  #   flash[:info] = "You need to make a choice"
  # end

  unless params[:next] == 'true'
    if answered_correctly?
      @border_color = 'green'
      flash[:info] = "You nailed it!"
    else
      @border_color = 'red'
      flash[:info] = "Oops... Try again!"
    end

    game.increment_tries
    @selected_answer = selected_answer

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