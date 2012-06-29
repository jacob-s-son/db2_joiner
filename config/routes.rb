Db2Joiner::Application.routes.draw do
  resources :declaration_categories do
    resources :declaration_statements
  end
  resources :vrp_categories
  resources :vrp_tasks
  resources :vrp_subtasks
  resources :institutions
  resources :declaration_statements
  
  root :to => 'declaration_categories#index'
end
