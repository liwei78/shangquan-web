Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  # resources :companies, :only => [:show] do
  #   member do
  #     post 'visited', 'favorite', 'share', "write"
  #   end
  # end
  # resources :activities, :only => [:show] do
  #   member do
  #     post 'visited', 'favorite', 'share', "write"
  #   end
  # end
  # resources :brands, :only => [:show] do
  #   member do
  #     get 'view'
  #     post 'write', 'like'
  #   end
  # end
  # resources :items, :only => [:show] do
  #   member do
  #     get 'view'
  #     post 'write', 'like'
  #   end
  # end
  
  resources :brands
  resources :items do
    collection do
      get 'my', 'store'
    end
  end
  
  resources :articles, :only => [:show] do
    member do
      get 'view'
      post 'write', 'like', 'share', 'collect'
    end
  end
  
  resources :messages do
    collection do
      get 'my'
    end
  end

  resources :users, :except => [:index, :destroy] do
    resources :articles, :only => [:show]
    # resources :items, :only => [:show]
    # resources :activities, :only => [:show]
    # resources :brands, :only => [:show]
    
    collection do
      get  'login',      :as => :welcome
      post 'checklogin', :as => :checklogin
      get  'logout',     :as => :logout
      # get  'write'
      # post 'postcontent'
      # get  'upload'
      # post 'uploadphoto'
      # get  'pubvideo'
      # post 'postvideo'
      # get  'pubitem'
      # post 'postitem'
      # get  'pubactivity'
      # post 'postactivity'
      # get  'pubbrand'
      # post 'postbrand'
      get  'setting'
      post 'updatesetting'
      get  'avatarsetting'
      post 'updateavatarsetting'
      get  'upgrade'
      post 'upgraderole'
      # get  'publish'
      # post 'postpublish'
      get  'share'
      post 'postshare'
      get  'discover'
      post 'postdiscover'
    end
    member do
      get 'articles'
      # get 'photos'
      # get 'videos'
      # get 'items'
      # get 'activities'
      # get 'brands'
    end
  end
  
  get "main/article", :as => :nav_article
  get "main/activity", :as => :nav_activity
  get "main/company", :as => :nav_company
  get "main/brand", :as => :nav_brand
  get "main/item", :as => :nav_item

  root :to => 'main#index'
end
