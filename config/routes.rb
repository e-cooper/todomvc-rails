Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root to: redirect('lists/1')
  resources :todo_lists, as: :lists, path: :lists
end
