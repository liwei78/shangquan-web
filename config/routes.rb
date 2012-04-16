Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  

  resources :archetypes do
    member do
      post 'minifollow', 'follow'
    end
  end

  resources :brands
  resources :activities
  resources :brands do
    member do
      post 'minifollow', 'follow'
    end
  end

  resources :article_items, :only => [:show] do
    member do
      post 'write', 'like', 'minilike'
    end
  end

  resources :items do
    collection do
      get 'my', 'store', 'search'
    end
    member do
      post 'write', 'like', 'minilike'
    end
  end
  
  resources :articles do
    member do
      post 'write', 'like', 'share', 'collect', 'del_photo'
    end
  end
  
  resources :messages do
    collection do
      get 'my'
    end
  end

  resources :users, :except => [:index, :destroy] do
    collection do
      get  'login',      :as => :welcome
      post 'checklogin', :as => :checklogin
      get  'logout',     :as => :logout
      get  'setting'
      post 'updatesetting'
      get  'avatarsetting'
      post 'updateavatarsetting'
      get  'upgrade'
      post 'upgraderole'
      get  'share'
      post 'postshare'
      get  'discover'
      post 'postdiscover'
      post 'postactivity'
      get  'find'
      post 'findbrand'
      post 'findcompany'
    end
    member do
      post 'follow', 'unfollow', 'minifollow'
    end
  end
  
  match '/main/activities'    => 'main#activities', :via => :get
  match '/main/items'         => 'main#items',      :via => :get
  match '/main/articles'      => 'main#articles',   :via => :get
  match '/main/companies'     => 'main#companies',  :via => :get
  match '/main/malls'         => 'main#malls',      :via => :get
  match '/main/brands'        => 'main#brands',     :via => :get
  match '/photo_temps/create' => 'photo_temps#create', :via => :post, :as => :uploadphototemp
  match '/brand_name_search'  => 'search#brand_name_search', :via => :post, :as => :brand_name_search
  match '/item_name_search'   => 'search#item_name_search',  :via => :post, :as => :item_name_search
  match '/uniqueid_search'    => 'search#uniqueid_search',   :via => :post, :as => :uniqueid_search
  root :to => 'main#index'
end
