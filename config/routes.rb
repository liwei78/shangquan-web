Shangquan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :brands
  resources :activities
  resources :brands
  resources :items do
    collection do
      get 'my', 'store'
    end
    member do
      post 'write', 'like'
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
    end
    member do
      post 'follow', 'unfollow', 'minifollow'
    end
  end

  root :to => 'main#index'
end
