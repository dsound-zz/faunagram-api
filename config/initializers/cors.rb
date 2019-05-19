class Application < Rails::Application

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors




config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'https://faunagram-app.herokuapp.com/' #replace this url with that of your own heroku client app
    resource '*', :headers => :any, :methods => [:get, :post, :patch, :put, :delte]
  end
end

end 

