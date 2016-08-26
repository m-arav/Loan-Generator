Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :loans
  #get 'loans/', to: 'loans#index'
  #post 'loans/', to: 'loans#create'
  root 'loans#index'
end
