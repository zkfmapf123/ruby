Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  # session
  post "/login" => "session#login"
  post "/join" => "session#join"
  post "/forget" => "session#forget"
  post "/createPassword" => "session#findPassword"
end
