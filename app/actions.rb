# Homepage (Root path)
helpers do
  def current_game
    Game.find(session[:id]) if session[:id]
  end

  def start_game
    game = Game.new
    session[:id] = game.id
    game
  end
end

get '/' do
  erb :index
end

post '/play' do
  @game = start_game unless current_game
  erb :"play/index"
end