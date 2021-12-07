Rails.application.routes.draw do

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
   }
   
   
  root to: 'homes#top'


  devise_scope :member do

  #Login後の遷移先変更
   #get "members/:id" => "members#show", as: :mypage

    get 'profiles', to: 'members/registrations#new_profile'
    post 'profiles', to: 'members/registrations#create_profile'
    get 'aim', to: 'members/registrations#new_aim'
    post 'aim', to: 'members/registrations#create_aim'
    

    
  end





 scope module: :members do

   # 退会確認画面
  get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'



  #静的ページの追加
  get  'homes/about'
  get  'homes/about_me'
  get  'homes/how'

  #member関係
  resources :members, only: [:show, :edit, :update]

  #record関係
  resources :records

 end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
