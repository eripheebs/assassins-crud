class Assassins < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  enable  :raise_errors
  disable :show_exceptions
  enable :inline_templates

  set :github_options, {
    :scope     => 'user',
    :secret    => ENV['GITHUB_CLIENT_SECRET'] || 'test_client_secret',
    :client_id => ENV['GITHUB_CLIENT_ID']     || 'test_client_id'
  }
  register Sinatra::Auth::Github


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def repos
      github_request("user/repos")
    end
  end
end
