Rails.application.routes.draw do
  namespace :user do
    get 'rooms/show'
  end
  namespace :user do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :user do
    get 'bookmarks/index'
  end
  namespace :user do
    get 'favorites/index'
  end
  namespace :user do
    get 'cats/index'
  end
  namespace :user do
    get 'items/index'
  end
  namespace :user do
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'breeds/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :user do
    get 'homes/top'
  end
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
end
