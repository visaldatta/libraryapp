Rails.application.routes.draw do
  root 'home#login'
  get '/logout' => 'home#logout', as: 'logout'
  post '/users/login' => 'users#login'
  get '/users/:id/messages' => 'users#messages'
  resources :bookings
  resources :bookings
  resources :rooms
  resources :bookings
  resources :users
  resources :users
  match 'bookings_path/allrooms' => 'bookings#allrooms', via: [:get]
  match 'bookings_path/search' => 'bookings#search', via: [:get]
  match 'bookings_path/find' => 'bookings#find', via: [:get]
  match 'bookings_path/newBooking' => 'bookings#newBooking', via: [:get]
  match 'bookings_path/newBooking' => 'bookings#newBooking', via: [:get]
  match 'bookings_path/history' => 'bookings#history', via: [:get]
  match 'bookings_path/createbookingfor' => 'bookings#createbookingfor', via: [:get]
  match 'bookings_path/bookForUser' => 'bookings#bookForUser', via: [:get]
  match 'bookings_path/userhistory' => 'bookings#userhistory', via: [:get]
  
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
