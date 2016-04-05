class Assassins < Sinatra::Base

  get '/sign-up' do
    erb :'sign_up/sign_up', :locals => {:client_id => CLIENT_ID}
  end

end
