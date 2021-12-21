Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
   }
   
  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_member'
  put 'withdraw/:name' => 'mems#withdraw' 
  
  # # 退会確認画面
  # get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  # # 論理削除用のルーティング
  # patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'
   
  

  #静的ページの追加
  get  'homes/about'
  # get  'homes#about_me'
  # get  'homes#how'


  #circle comment 非同期用
  mount ActionCable.server => '/cable'


  devise_scope :member do


    get 'profiles', to: 'members/registrations#new_profile'
    post 'profiles', to: 'members/registrations#create_profile'
    get 'aims', to: 'members/registrations#new_aim'
    post 'aims', to: 'members/registrations#create_aim'



  end

 scope module: :members do
  # #member関係
  # resources :members, only: [:show, :edit, :update] do
  #   #record関係
  #   resources :records do
  #     resource :rec_goods, only: [:create, :destroy]
  #     resources :rec_comments, only: [:create, :destroy]
  #   end


  #member関係
  resources :members, only: [:show, :edit, :update] do
    #follow数表示のため
    member do
      get :followings, :followers
    end

  end
  
     #record関係
    resources :records do
      resource :rec_goods, only: [:create, :destroy]
      resources :rec_comments, only: [:create, :destroy]
    end
  

    #profile
    resources :profiles, only: [:show, :edit, :update]
    #aim
    resources :aims, only: [:show, :edit, :update]

    #Follow関連
    resources :relationships, only: [:create, :destroy]


    #diary関係
    resources :diaries do
      resource :dia_goods, only: [:create, :destroy]
      resources :dia_comments, only: [:create, :destroy]
    end

  #circle関係
  resources :circles do
    resources :cir_comments, only: [:index, :create, :destroy]
    get "join" => "circles#join" #circle参加機能
  end



 end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end