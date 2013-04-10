Clocker::Application.routes.draw do

  root to: 'dashboard/projects#list', constraints: lambda { |r| ! r.session[:user_id].blank? }
  root to: 'home#home'

  # Account management
  namespace :account do

    # Account settings
    get  'settings', to: 'settings#index'
    post 'settings/:action', controller: :settings

    # Account registration, login, and logout
    match ':action'
  end

  # Authenticated dashboard routes
  namespace :dashboard do

    # Project management
    match 'projects(/:action(/:id))',
      controller: :projects,
      action:     :list

    # Entry management
    match 'project/:project(/:action(/:id))',
      controller: :entries,
      action:     :list

    # General dashboard actions
    match ':action'
  end

  # General home routes
  match ':action', controller: :home

end
