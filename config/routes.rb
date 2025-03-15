Rails.application.routes.draw do
  get "food_groups/new"
  get "food_groups/create"
  devise_for :users, path: "profilo",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               password: "password",
               # confirmation: 'verifica-password',
               registration: "registrazione",
               sign_up: "crea"
             },
             controllers: {
               registrations: "users/registrations",
               sessions: "users/sessions"
             }

  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      resources :users
      resources :food_groups
      root to: "dashboard#index", as: :root
    end
  end
  get "privacy", to: "pages#privacy", as: :privacy
  get "privacy-registrazione", to: "pages#privacy_registration_page", as: :privacy_registration
  get "cookies", to: "pages#cookies", as: :cookies

  root "pages#index"
end
