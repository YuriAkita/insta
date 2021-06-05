Rails.application.routes.draw do
  get 'sessions/new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :show, :destroy]
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
