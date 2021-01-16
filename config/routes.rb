Rails.application.routes.draw do
  resources :cats, only: [:show]
  put "/cats/query/:id", to: "cats#update_with_query"
  put "/cats/local/:id", to: "cats#update_with_local_var"
  put "/cats/memo/:id",  to: "cats#update_with_memoized"
end
