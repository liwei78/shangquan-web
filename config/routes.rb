Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

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
  
  get "main/fashion", :as => :fashion
  get "main/activity", :as => :activity
  get "main/member", :as => :member
  get "main/brand", :as => :brand
  get "main/good", :as => :good

  root :to => 'main#index'
end
