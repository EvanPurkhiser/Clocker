Clocker::Application.routes.draw do

  root to: 'home#index'

  get  'account/settings', to: 'account/settings#index'
  post 'account/settings/:action', controller: 'account/settings'

  match 'account/:action', controller: :account

end
