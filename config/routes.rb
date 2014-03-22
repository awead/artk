Artk::Engine.routes.draw do

  # /resources
  # /resources/ARC-0001
  # /resources/ARC-0001/components

  resources :resources, :only => [:index, :show] do
    resources :components, :only => [:index, :show] do
      resources :instances, :only => [:index]
    end
  end

  resources :accessions, :only => [:index]

end
