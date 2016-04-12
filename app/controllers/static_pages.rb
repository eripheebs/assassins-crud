class Assassins < Sinatra::Base

  get '/' do
    erb :index, :locals => {:client_id => CLIENT_ID}
  end

  get '/about' do
    erb :about
  end

end
