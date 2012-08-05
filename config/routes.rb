Yalile::Application.routes.draw do

  # ================ DEVISE ROUTES FOR USERS ===============================================
  devise_for :user, skip: [:sessions, :passwords]
  devise_scope :user do
    # ================ ROOT ================================================================
    root to: "user/sessions#new"
    # ================ DEVISE ROUTES =======================================================
    get "login", to: "user/sessions#new", as: "new_user_session"
    post "login", to: "user/sessions#create", as: "user_session"
    delete "logout", to: "user/sessions#destroy", as: "destroy_user_session"
  end

  # ================= PRODUCTS ROUTES ======================================================
  resources :products, only: [:index, :new, :create] do
    # =============== PRODUCT ARTICLES ROUTES ==============================================
    resources :articles, only: [:index, :show, :new, :create]
  end

  # ================ SALES ROUTES ==========================================================
  resources :sales, only: [:index, :show, :new, :create] do
    # ================ SALES TRANSACTIONS ROUTES ===========================================
    resources :sale_transactions, only: [:destroy], as: :transactions
  end

  # ================ SALES TRANSACTIONS ROUTES =============================================
  resources :sale_transactions, only: [:index], path: :"sale-transactions"

  # ================ USERS ROUTES ==========================================================
  scope module: :user do
    resources :users, only: [:index, :new, :create]
  end
  

  # ================ INFORMATIONS ROUTES ===================================================
  get ":resource/information" => "informations#index", as: :informations
  get ":resource/:id/information" => "informations#show", as: :get_information
end
#== Route Map
# Generated on 05 Aug 2012 11:11
#
#        user_registration POST   /user(.:format)                                 devise/registrations#create
#    new_user_registration GET    /user/sign_up(.:format)                         devise/registrations#new
#   edit_user_registration GET    /user/edit(.:format)                            devise/registrations#edit
#                          PUT    /user(.:format)                                 devise/registrations#update
#                          DELETE /user(.:format)                                 devise/registrations#destroy
#                     root        /                                               user/sessions#new
#         new_user_session GET    /login(.:format)                                user/sessions#new
#             user_session POST   /login(.:format)                                user/sessions#create
#     destroy_user_session DELETE /logout(.:format)                               user/sessions#destroy
#         product_articles GET    /products/:product_id/articles(.:format)        articles#index
#                          POST   /products/:product_id/articles(.:format)        articles#create
#      new_product_article GET    /products/:product_id/articles/new(.:format)    articles#new
#          product_article GET    /products/:product_id/articles/:id(.:format)    articles#show
#                 products GET    /products(.:format)                             products#index
#                          POST   /products(.:format)                             products#create
#              new_product GET    /products/new(.:format)                         products#new
#         sale_transaction DELETE /sales/:sale_id/sale_transactions/:id(.:format) sale_transactions#destroy
#                    sales GET    /sales(.:format)                                sales#index
#                          POST   /sales(.:format)                                sales#create
#                 new_sale GET    /sales/new(.:format)                            sales#new
#                     sale GET    /sales/:id(.:format)                            sales#show
#        sale_transactions GET    /sale-transactions(.:format)                    sale_transactions#index
#                    users GET    /users(.:format)                                user/users#index
#             informations GET    /:resource/information(.:format)                informations#index
#          get_information GET    /:resource/:id/information(.:format)            informations#show
