Rails.application.routes.draw do
  get 'contacts' => 'charts#contacts'
  get 'quotes_chart' => 'charts#quotes_chart'
  get 'elevators_per_client' => 'charts#elevators_per_client'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'
  get 'quote' => 'pages#quote'
  get 'commercial' => 'pages#commercial'
  get 'residential' => 'pages#residential'
  get 'index' => 'pages#index'
  post 'quote_res' => 'pages#quote_post'
  post 'quote_comm' => 'pages#comm_post'
  post 'quote_cor' => 'pages#cor_post'
  post 'quote_hyb' => 'pages#hyb_post'
  post 'contact_us' => 'pages#contact_us_post'
  
  resources :views
  get 'views' => 'pages#views'

end
