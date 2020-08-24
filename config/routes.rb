Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  # session
  get "/login" => "session#login"
  get "/join" => "session#join"
  get "/forget" => "session#forget"
  delete "/logout" => "session#logout"
end
