Rails.application.routes.draw do
  root to: "home#index"

  mount ActionCable.server => '/cable'
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'home/index'
  delete 'users/:id', :to => 'users#destroy' , :as => :users

  post 'messages', to: 'messages#create'

  resources :events do
    get :attend
    resources :comments
    collection do
      get 'filter/:filter' => :filter, as: :filter
    end
  end
end
