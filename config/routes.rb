Rails.application.routes.draw do
  
  # Subscriber  
  get 'subscribers/new'
  post 'subscribers', to: "subscribers#create"

  # Presenter
  get 'presenters/new'
  post 'presenters', to: "presenters#create"
  get 'presenters/update'

  get 'presenters/delete'
  
  # Workshop

  get 'workshops/admin_home'
  get 'workshops/show_single_record'
  resources :workshops
  
  
  
  root to: 'workshops#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
