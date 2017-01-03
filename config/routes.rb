Rails.application.routes.draw do

  get 'users/profile'

  root 'home#index'
  devise_for :users,controllers: {:omniauth_callbacks => "users/omniauth_callbacks",registrations: "users/registrations"}, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout"}
  resources :posts  do
  	resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
