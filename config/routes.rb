ConfirmeFacil::Application.routes.draw do

  resources :appointments
  resources :confirmations

  match "get_unconfirmed_appointments" => "confirmations#get_unconfirmed_appointments"

  root :to => "sms_manager#index"

end
