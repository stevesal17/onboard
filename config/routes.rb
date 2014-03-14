Onboard::Application.routes.draw do
  
  
  # get "about" => "contents#about"
  get "auth/:provider/callback" => "social_logins#create"


  # set up the index, show, new, create, edit, update, destroy for rooms
  resources :rooms do
  #resources :rooms, path: “places” ----if I wanted to change this easily to places inthe url
  # because i'm placing orders onto room
  # this is a nested resource
    resources :orders, only: [:new, :create]
  end

  # another section to my site,
  # that is the index and show orders pages
  # new and create are in the nested resources above as
  # they rely on the room
  resources :orders, only: [:index, :show]



  resources :users

  # lets have a log in and log out section to our site
  # this is a singular resource because as a user
  # we only ever are logged in once NOT multiple times
  resource :session

  # so what is the homepage?
  root "rooms#index"


end
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

