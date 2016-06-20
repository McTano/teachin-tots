helpers do
  def game
    session[:game] ||= Game.new(params[:category])
  end

  def selected_answer
    params[:choice_index].to_i if params[:choice_index]
  end

  def answered_correctly?
    game.current_question.correct?(selected_answer) if selected_answer
  end

  def answer_class(choice)
    return "" unless choice == selected_answer

    if answered_correctly?
      "correct"
    elsif answered_correctly?.nil?
      ""
    else
      "wrong"
    end
  end
end

before '/play' do
  @game = game
end

before '/play/:category' do
  @game = game
end

before '/end' do
  @game = game
end

get '/' do
  session.clear
  erb :index
end

get '/play' do
  erb :'play/index'
end

post '/play' do

  unless params[:next] == 'true'
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

get '/play/:category' do
  erb :'play/index'
end

get '/end' do
  erb :'end/index'
end