Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :admins, path_names: { sign_up: 'secret_passage' }
  devise_for :users
  resources :projects
  get 'tags/:tag', to: 'projects#index', as: :tag
end
