Rails.application.routes.draw do
  get 'tops/index'

  resources :atendees
  resources :presenters
  resources :meetings
  devise_for :users

  get 'tops/find', to: 'tops#find'
  post 'tops/find', to: 'tops#find'

  resources :tops

  get 'tops/index'
  root 'tops#index'

  


  get 'presenters/downloadpdf/:id' => 'presenters#downloadpdf' ,as: :download_pdf
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
