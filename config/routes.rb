Rails.application.routes.draw do
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
