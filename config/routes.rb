Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  devise_for :admin, path: 'admin_auth', path_names: {sign_in: 'login', sign_out: 'logout'}, controllers: {
    sessions: "admin/sessions"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "user/sessions#new_guest"
  end

  resources :searches, only: [:index]

  scope module: :user do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        patch :cancellation
      end
      member do
        get :follows, :followers
      end
      resources :reports, only: [:new, :create]
      resources :relationships, only: [:create, :destroy, :index]
      resources :cats, only: [:index, :create, :update, :destroy]
      resources :items, only: [:index, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy] do
        resource :favorites, only: [:index, :create, :destroy]
        resources :bookmarks, only: [:index, :create, :destroy]
        resources :comments, only: [:create, :destroy] do
          resources :reports, only: [:new, :create]
        end
      end
    end
    resources :notifications, only: [:index, :update] do
      patch :mark_as_read, on: :collection
    end
    resources :maps, only: [:index]
    resources :all_posts, only: [:index]
    resources :all_cats, only: [:index]
    resources :favorites, only: [:index]
    resources :bookmarks, only: [:index]
    resources :messages, only: [:show, :create, :destroy]
    resources :contacts, only: [:create]
  end


  namespace :admin do
    root to: 'homes#top'
    resources :all_posts, only: [:index]
    resources :all_comments, only: [:index]
    resources :reports, only: [:show, :index, :update]
    resources :contacts, only: [:show, :index, :update]
    resources :breeds, only: [:index, :create, :update, :destroy]
    resources :users, only: [:index, :show, :update, :destroy] do
      member do
        patch :inactive
      end
      resources :posts, only: [:index, :show, :destroy] do
        resources :comments, only: [:destroy]
      end
    end
  end

end
