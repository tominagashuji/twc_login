Rails.application.routes.draw do
  # get 'sessions/new'

##  heroku 登録用に追記
##  root 'tops#blogs' これじゃダメだった。なんで？↓エラーでルーティングが出てて何となく表示させたいパスにしたら通った！
  # root 'blogs#index'

##  get '/contacts', to: 'contacts#index'#課題１問い合わせ画面作成
  resources :contacts

  get '/stocks', to: 'stocks#index'#小課題rails入門４

##  get '/blogs', to: 'blogs#index' #追記する
  resources :blogs
  
##  ログインシステムのルーティング設定
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
##  ログインシステム：起動時にログイン画面が表示されるようにする
  root 'sessions#new'

end