Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'loans/progress/', to: 'loans#progress', as: :progress
  get 'loans/start_timer/', to: 'loans#start_timer', as: :start_timer
  resources :loans
  get 'loans/timer/:id', to: 'loans#timer', as: :loan_timer
  #get 'loans/', to: 'loans#index'
  #post 'loans/', to: 'loans#create'
  root 'loans#index'
end
