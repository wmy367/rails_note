Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  root to: 'static_pages#home'

  resource 'users'

  resource 'sessions',only:[:new,:create,:destroy]

  delete 'signout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
