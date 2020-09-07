Rails.application.routes.draw do
  # db설정
  get "/db" => "home#db"

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
  get "/lesson/:id/detail" => "lesson#detail"
  get "/lesson/sort" => "lesson#sort"
  post "/lesson/:id/create" => "lesson#create"

  # crud 작업
 
  # professor
  get "/professor" => "professor#index" 
  get "/professor/:id/detail" => "professor#detail"
  post "/professor/:id/create" => "professor#create"

  # crud 작업

  # homework 과제공유 내 과제
  get "/homework/user" => "homework#index"
  get "/homework/lesson/:id" => "homework#lesson"
  get "/homework/lesson/:id/detail" => "homework#detail"
  
  # 연습
  post "/homework/create" => "homework#create"
  # crud 작업
  
  # calculator javascript단에서 마무리
  get "/calculator" => "calculator#index"

  # chat 서비스 준비 중
  get "/chat" => "chat#index"

end
