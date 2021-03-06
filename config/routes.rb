Rails.application.routes.draw do
  
  get 'sessions/new'

  resources :users
  resources :sessions

  root 'home#index'
  
  #routes for home
  get 'about' => "home#about"
  get 'contact' => "home#contact"
  get 'help' => "home#help"
  get 'credits' => "home#credits"
  
  #routes for tutorials
  get 'tutorials' => 'tutorials#index'
  post 'tutorials' => 'tutorials#create'
  get 'tutorials/new' => 'tutorials#new', as: :new_tutorial
  delete 'tutorials/:id' => 'tutorials#destroy' , as: :delete_tutorial
  get 'tutorials/:id/edit' => 'tutorials#edit', as: :edit_tutorial  
  post 'tutorials/:id' => 'tutorials#update', as: :update_tutorial
  
  get 'signup', to: 'users#new', as: :signup
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'myaccount', to: 'sessions#info', as: :info
  
  get 'user/tutorials' => 'tutorials#show_user_tutorials', as:  :show_user_tutorials
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
