Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'form2/new'
  get 'form1s' => 'form1#new'
  post   'form1s'   => 'form1#create'
  get 'form2s' => 'form2#new'
  post   'form2s'   => 'form2#create'
  get 'users/new'
  get 'form1/new'
  get 'sessions/new'
  get 'welcome/index' 
  get '/users/:id/report', to: 'users#report', as: 'report'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'newform1' => 'form1#new'
  get 'newform2' => 'form2#new'
  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'
  # post '/users/:user_id/companies/:id', :to => "companies#destroy"
  resources :users do
    resources :form1
    resources :form2
    resources :companies
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
