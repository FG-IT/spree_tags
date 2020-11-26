Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
  	resources :tags
  end

  namespace :api, defaults: { format: 'json' } do
	  namespace :v1 do
	  	resources :tags
	  end
  end
end
