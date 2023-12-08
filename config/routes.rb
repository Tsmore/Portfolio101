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

  # deviseとかぶるためmenbersにurlを変更
  scope module: :user do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update] do
      collection do
        patch :cancellation
      end
      member do
        get :follows, :followers
      end
      resources :relationships, only: [:create, :destroy]
      resources :notifications, only: [:index, :update] do
        collection do
          patch :mark_as_read
        end
      end
      resources :reports, only: [:new, :create]
      resources :cats, only: [:index, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy] do
        resources :comments, only: [:create, :destroy] do
          resources :reports, only: [:new, :create]
        end
        resources :reports, only: [:new, :create]
      end
      resources :favorites, only: [:index, :create, :destroy]
      resources :bookmarks, only: [:index, :create, :destroy]
      resources :items, only: [:index, :create, :update, :destroy]
      resources :rooms, only: [:create, :show] do
        resources :messages, only: [:create, :destroy]
      end
    end
  end
  resources :all_posts, only: [:index], module: :user
  resources :all_cats, only: [:index], module: :user


  namespace :admin do
    root to: 'homes#top'
    resources :breeds, only: [:index, :create, :update, :destroy]
    resources :users, only: [:index, :show, :update] do
      collection do
        patch :cancellation
      end
      resources :posts, only: [:index, :show, :destroy] do
        resources :comments, only: [:destroy]
      end
    end
  end

end
