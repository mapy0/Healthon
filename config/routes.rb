Rails.application.routes.draw do

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
   }
   
  devise_scope :member do
    get 'profiles', to: 'members/registrations#new_profile'
    post 'profiles', to: 'members/registrations#create_profile'
    get 'aim', to: 'members/registrations#new_aim'
    post 'aim', to: 'members/registrations#create_aim'
  end
   
   
   # 退会確認画面
  get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'


  root to: 'homes#top'
  #静的ページの追加
  get  'homes/about'
  get  'homes/about_me'
  get  'homes/how'

  #member関係
  resources :members, only: [:show, :edit]
  
  
   
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
