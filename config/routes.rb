Sawit::Application.routes.draw do

  get "events/index"
  get "pages/ads"
  get "pages/privacy"
  get "pages/sitemap"
   devise_for :users
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :groups do
    member do
      get :follow
    end
  end

  resources :users do
    member do
      get :following
    end
  end

  resources :pages
  resources :users
  resources :ads

   resources :relationships, only: [:create, :destroy]
  


  resources :jobs do
    resources :comments
    resources :votes
  end

  resources :comments do
    resources :comments
    resources :votes
  end

  

  root :to => "cities#show", :id => '1'

  resources :states   do
    resources :links
    resources :groups do
    resources :links
  end
    resources :jobs 
    resources :resources
    resources :events
    resources :bills
  end

  resources :countries do
    resources :links
  end

  resources :reps do
    resources :links
  end

resources :districts do
  resources :links
end

resources :resources

resources :groups do
  resources :links
end

resources :cities do
  resources :links do
  resources :comments
  end
  resources :groups do
    resources :links
  end
  resources :jobs
  resources :districts do
    resources :links
  end 
  resources :resources
  resources :events
  resources :ads
  resources :bills
end


resources :links do
    resources :comments
    resources :votes
  end

  resources :events do
    resources :comments
    resources :votes
  end
  
    resources :bills do
    resources :comments
    resources :votes
  end

  

 

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
