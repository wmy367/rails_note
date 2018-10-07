Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  root to: 'static_pages#home'

  resources 'users'

  resources 'sessions',only:[:new,:create,:destroy]

  delete 'signout', to: 'sessions#destroy'


  ## ---
  # get       'feeds/new'
  # post      'feeds/new'
  resources     :feeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## type
   get 'static_pages/health_type'
   get 'static_pages/light_type'
   get 'static_pages/life_type'
   get 'static_pages/emotion_type'
   get 'static_pages/float_note_ctrl'

end
