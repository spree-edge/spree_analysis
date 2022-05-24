Spree::Core::Engine.add_routes do
  namespace :admin do
    get 'analysis/download', to: 'analysis#download'
    resources :analysis
  end
end
