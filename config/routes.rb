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
    resources :articles, only: [:index, :new]
  end
  
  # ================= AARTICLES ROUTES =====================================================
  resources :articles, only: :show

end
#== Route Map
# Generated on 27 May 2012 12:58
#
#     new_user_session GET    /login(.:format)                         user/sessions#new
#         user_session POST   /login(.:format)                         user/sessions#create
# destroy_user_session DELETE /logout(.:format)                        user/sessions#destroy
#     product_articles GET    /products/:product_id/articles(.:format) articles#index
#             products GET    /products(.:format)                      products#index
#                      POST   /products(.:format)                      products#create
#          new_product GET    /products/new(.:format)                  products#new
