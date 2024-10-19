Rails.application.routes.draw do
  get 'food_groups/new'
  get 'food_groups/create'
  devise_for :users, path: 'profilo',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'password',
               #confirmation: 'verifica-password',
               registration: 'registrazione',
               sign_up: 'crea-registrazione'
             },
             controllers: {
               registrations: 'user/registrations',
               sessions: 'user/sessions'
             }

  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      resources :users
      resources :food_groups
      root to: 'dashboard#index', as: :root
    end
  end

  root "pages#index"
end
