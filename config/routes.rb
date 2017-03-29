Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  delete 'users/:id', :to => 'users#destroy' , :as => :users

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :events do
    get :attend
    resources :comments
    collection do
      get 'filter/:filter' => :filter, as: :filter
    end
  end
end
