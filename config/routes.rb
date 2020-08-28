Rails.application.routes.draw do
  get 'chat/index'
  get 'calculator/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  # session
  post "/login" => "session#login"
  post "/join" => "session#join"
  post "/forget" => "session#forget"
  post "/createPassword" => "session#findPassword"
  delete "/logout" => "session#logout"

  # lesson
  get "/lesson" => "lesson#index"
  
  # professor
  get "/professor" => "professor#index" 

  # calculator
  get "/calculator" => "calculator#index"

  # chat
  get "/chat" => "chat#index"

end
