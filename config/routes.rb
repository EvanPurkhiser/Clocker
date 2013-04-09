Clocker::Application.routes.draw do

  root to: 'home#index'

  # Account settings
  get  'account/settings', to: 'account/settings#index'
  post 'account/settings/:action', controller: 'account/settings'

  # Account registration, login, and logout
  match 'account/:action', controller: :account

  # General dashboard actions
  match 'dashboard/:action', controller: :dashboard

end
