Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  # get 'cats', to: 'cats#index'
  # get 'cats/:id', to: 'cats#show'
  # post 'cats', to: 'cats#create'
  # patch 'cats/:id', to: 'cats#update'
  # put 'cats/:id', to: 'cats#update'
  # delete 'cats/:id', to: 'cats#destroy'
  # get 'cats/:id/edit', to: 'cats#edit'
  # get 'cats/new', to: 'cats#new'

end
