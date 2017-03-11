Rails.application.routes.draw do
  get 'home/index'
  resources :events do
    get :attend
    resources :comments
    collection do
      get 'filter/:filter' => :filter, as: :filter
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
