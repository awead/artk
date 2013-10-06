Artk::Engine.routes.draw do

  # /resources
  # /resources/ARC-0001
  # /resources/ARC-0001/components

  resources :resources, :only => [:index, :show] do
    resources :components, :only => [:index]
  end

  resources :accessions, :only => [:index]

end
