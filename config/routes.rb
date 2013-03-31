Clocker::Application.routes.draw do

  root to: 'home#index'

  match 'account/:action', controller: :account

end
