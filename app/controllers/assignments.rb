class Assassins < Sinatra::Base

  post '/assignments' do
    flash.keep[:notice] = "Thanks. Please watch your email for further instructions."
    redirect '/'
  end

  get '/about' do
    erb :about
  end

end
