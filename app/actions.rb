# Homepage (Root path)
helpers do
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
  @game = start_game
  erb :"play/index"
end