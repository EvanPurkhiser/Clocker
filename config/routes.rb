Clocker::Application.routes.draw do

  root to: 'dashboard/projects#list', constraints: lambda { |r| ! r.session[:user_id].blank? }
  root to: 'home#home'

  # Account settings
  get  'account/settings', to: 'account/settings#index'
  post 'account/settings/:action', controller: :'account/settings'

  # Account registration, login, and logout
  match 'account/:action', controller: :account

  # Project management
  match 'dashboard/projects(/:action(/:id))',
    controller: :'dashboard/projects',
    action:     :list

  # General dashboard actions
  match 'dashboard/:action', controller: :dashboard

  # General home routes
  match ':action', controller: :home

end
