Rails.application.routes.draw do
  root "items#index"
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items  do# 8條路徑
    member do
      post :add_to_cart
    end
    resources :comments, only: [:create]
  end
  # resources :comments
  # # /comments 看到所有留言
  # # /comments/:id 
  # # /comments/new
  # # /comments/create
  # # .comments/edit

  #cart
  # post "/abc/id", to "cart#add", as: :cc # 請你幫我做一個path 出來/
  resource :cart, only: [:show, :destroy]  do# 做出單數的東西/ rescource 沒加s
    collection do  # 新增購物車的結帳頁面
      get :checkout
    end
  end

# 
  resource :orders, only: [:index, :show, :create] do
    member do
      delete :cancel
    end
  end


  #/users/edit
  #/usrs/3/edit
  # user
  # get "/", to: "welcome#index"
  # 泛用型的寫法
  get '/login', to: "users#login"
  post '/login', to: 'users#sign_in'
  delete "/logout", to: "users#logout"
  get '/sign_up', to: "users#sign_up"
  post '/sign_up', to: "users#registration"
  # get post put patch delete (現在瀏覽器只有get/post 這兩個動作)
  # 方法   controller 見一個檔案
  
  namespace :api do
    namespace :v1 do
      resources :items, only: [] do
        member do 
          post :favorite
        end
        # collection do 
        #   get :all
        # end
      end
    end
  end
end
