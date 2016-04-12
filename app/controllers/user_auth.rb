require 'sinatra/auth/github'

class Assassins < Sinatra::Base
    enable  :raise_errors
    disable :show_exceptions
    enable :inline_templates

    set :github_options, {
      :scope     => 'user',
      :secret    => ENV['GITHUB_CLIENT_SECRET'] || 'test_client_secret',
      :client_id => ENV['GITHUB_CLIENT_ID']     || 'test_client_id'
    }
    register Sinatra::Auth::Github

    get '/' do
      erb :index
    end

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
