class Assassins < Sinatra::Base

  get '/welcome' do
    erb :index, :locals => {:client_id => CLIENT_ID}
  end

  get '/about' do
    erb :about
  end

end
