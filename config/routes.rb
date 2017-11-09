Rails.application.routes.draw do
  root 'items#index'
  get '/thanks', to: "upgrades#thanks"

  resources :items
  devise_for :users
  resources :profiles, except:[:index,:destroy,:edit] do
    resources :comments, only: [:create,:destroy]
  end
  resources :conversations, except:[:edit,:update] do
    resources :messages, only:[:create,:destroy,]
  end
  resources :posts, only:[:index]
  resources :upgrades, only:[:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
