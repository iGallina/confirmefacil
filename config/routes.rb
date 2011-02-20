ConfirmeFacil::Application.routes.draw do

  resources :appointments

  root :to => "sms_manager#index"

end
