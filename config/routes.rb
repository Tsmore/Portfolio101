Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # deviseとかぶるためmenbersにurlを変更
  scope module: :user do
    root to: 'homes#top'
    resources :members, only: [:index, :show, :update], controller: 'users' do
      collection do
        patch :cancellation
      end
      resources :cats, only: [:index, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:index, :create, :destroy]
        resources :bookmarks, only: [:index, :create, :destroy]
      end
      resources :items, only: [:index, :create, :update, :destroy]
    end
  end
  namespace :user do
    get 'rooms/show'
  end

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
