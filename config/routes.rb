ConfirmeFacil::Application.routes.draw do

  resources :appointments
  resources :confirmations

  root :to => "sms_manager#index"

end
