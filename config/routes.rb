Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/register', to: 'application#show'
  post '/upload', to: 'application#upload'
  get '/about', to: 'application#about'
end
