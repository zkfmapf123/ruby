
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
  delete "/lesson/:id/delete" => "lesson#delete"
  post "/lesson/:id/detail/favorite" => "lesson#favorite"
  get "/lesson/:id/detail/point" => "lesson#good_bad_flag" 
  
  # professor
  get "/professor" => "professor#index" 
  get "/professor/:id/detail" => "professor#detail"
  post "/professor/:id/create" => "professor#create"
  get "/professor/:id/detail/point" => "professor#good_bad_flag"
  delete "/professor/:id/delete" => "professor#delete"
  # crud 작업

  # homework 과제공유 내 과제
  get "/homework/default" => "homework#default"
  get "/homework/user" => "homework#index"                        # 내 과제
  get "/homework/lesson/:id" => "homework#lesson"                 # 게시판
  get "/homework/lesson/:id/create" => "homework#create"          # 글쓰기
  post "/homework/lesson/:id/postCreate" => "homework#postCreate" # 글쓰기Post
  get "/homework/:id/detail" => "homework#detail"                 # 세부항목
  post "/homework/:id/create" => "homework#homeworkCreate"
  delete "/homework/lesson/:id/delete" => "homework#delete"
  delete "/comment/:id/delete" => "homework#commentDelete"
  
  # calculator javascript단에서 마무리
  get "/calculator" => "calculator#index"

  # chat 서비스 준비 중
  get "/chat" => "chat#index"

end
