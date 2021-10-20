Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users
  resources :tasks, only: [:index, :create, :show, :edit, :update, :delete]
  resources :tasks do
    member do
      get 'timer'
    end
  end
end
