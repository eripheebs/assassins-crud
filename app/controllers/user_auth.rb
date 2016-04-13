class Assassins < Sinatra::Base

    get '/profile' do
      authenticate!
      user = User.first(email: github_user.email)
      if user.nil?
        flash.now[:error] = ["Please join the game!"]
        erb :index
      else
        session[:user_id] = user.id
        erb :profile
      end
    end

    get '/login' do
      authenticate!
      user = User.first(email: github_user.email)
      if user.nil?
        flash.now[:error] = ["Please join the game!"]
        erb :index
      else
        session[:user_id] = user.id
        redirect '/'
      end
    end

    get '/logout' do
      logout!
      redirect '/'
    end

    get '/join_game' do
      erb :join_game
    end

    post '/joined' do
      authenticate!
      if !User.first(email: github_user.email)
        user = User.create(username: github_user.name, email: github_user.email)
        session[:user_id]= user.id
      end
      redirect '/'
    end

    get '/joined' do
      redirect '/'
    end
end

class BadAuthentication < Sinatra::Base
  get '/unauthenticated' do
    status 403
    <<-EOS
    <h2>Unable to authenticate, sorry bud.</h2>
    <p>#{env['warden'].message}</p>
    EOS
  end
end
