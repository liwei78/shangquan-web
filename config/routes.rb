Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :companies, :only => [:show]
  resources :activities, :only => [:show]
  resources :brands, :only => [:show]
  resources :goods, :only => [:show]

  resources :users, :except => [:index, :destroy] do
    resources :articles, :only => [:show]
    resources :goods, :only => [:show]
    collection do
      get  'login',      :as => :welcome
      post 'checklogin', :as => :checklogin
      get  'logout',     :as => :logout
      get  'write'
      post 'postcontent'
      get  'upload'
      post 'uploadphoto'
      get  'pubvideo'
      post 'postvideo'
      get  'pubgood'
      post 'postgood'
      get  'setting'
      post 'updatesetting'
    end
    member do
      get 'articles'
      get 'photos'
      get 'videos'
      get 'goods'
    end
  end
  
  get "main/fashion", :as => :nav_fashion
  get "main/activity", :as => :nav_activity
  get "main/company", :as => :nav_company
  get "main/brand", :as => :nav_brand
  get "main/good", :as => :nav_good

  root :to => 'main#index'
end
