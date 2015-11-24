Rails.application.routes.draw do
  resources :bookings
  resources :customers do
    resources :cards
    resources :customer_orders, path: 'orders'
  end
  resources :cards, only: [:show] do
    resources :card_orders, path: 'orders' do
      get 'incomplete'
    end
  end
  resources :tables do
    resources :occupancies do
      collection do
        get 'current'
        get 'bookings'
      end
    end
    resources :table_orders, path: 'orders'
    member do
      post 'assign_order/:order' => 'tables#assign_order'
      post 'call_waiter' => 'buttons#call_waiter'
      post 'request_bill' => 'buttons#request_bill'
      post 'leave_table' => 'buttons#leave_table'
    end
    collection do
      get 'occupied'
    end
  end

  resources :bleeprs

  resources :orders do
    collection do
      get 'open'
      get 'progress'
    end
  end

  match "/websocket", :to => ActionCable.server, via: [:get, :post]
  get 'relay' => 'relay#index'
  post 'relay/:id' => 'relay#pressed'

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
