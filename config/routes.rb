Savewindpower::Application.routes.draw do
  resources :petitions
  root :to => 'petitions#index'
end
