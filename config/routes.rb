Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :companies, :only => [:show]
  resources :activities, :only => [:show]
  resources :brands, :only => [:show]
  resources :goods, :only => [:show]

  resources :users, :except => [:index, :destroy] do
    resources :articles, :only => [:show]
    collection do
      get  'login',      :as => :welcome
      post 'checklogin', :as => :checklogin
      get  'logout',     :as => :logout
      get  'write'
      post 'postcontent'
      get  'upload'
      post 'uploadpic'
      get  'pubvideo'
      post 'postvideo'
    end
    member do
      get 'articles'
    end
  end
  
  get "main/fashion", :as => :nav_fashion
  get "main/activity", :as => :nav_activity
  get "main/company", :as => :nav_company
  get "main/brand", :as => :nav_brand
  get "main/good", :as => :nav_good

  root :to => 'main#index'
end
