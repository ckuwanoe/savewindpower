Savewindpower::Application.routes.draw do
  match '/thanks', :to => 'petitions#thanks'
  resources :petitions
  root :to => 'petitions#index'
end
