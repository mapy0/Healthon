Rails.application.routes.draw do

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
   }
   
   # 退会確認画面
  get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'


   root to: 'homes#top'
   #静的ページの追加
   get  'homes/about'
   get  'homes/about_me'
   get  'homes/how'

   
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
