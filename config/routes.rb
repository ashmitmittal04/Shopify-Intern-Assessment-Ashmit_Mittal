# config/routes.rb
Rails.application.routes.draw do
  resources :articles do
    collection do
      get 'search'
    end
  end
  root to: 'articles#index'
end

