Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy] do
    member do
      get 'timer'
    end
    resources :pomodoros, only: [:create, :destroy]
  end
end
