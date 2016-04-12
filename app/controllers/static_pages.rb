class Assassins < Sinatra::Base

  get '/' do
    # switch to session once sessions are in place
    if User.first
      @current_user_target = User.get(Assignment.first(assassin_id: User.first.id).target_id)
      erb :'assignments/index'
    else
      erb :index
    end
  end

  get '/about' do
    erb :about
  end

end
