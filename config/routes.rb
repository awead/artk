Artk::Engine.routes.draw do

  # /resources
  # /resources/ARC-0001
  # /resources/ARC-0001/components
  # /resources/ARC-0001/components/ref1

  resources :resources, :only => [:index, :show] do
    resources :components, :only => [:index, :show]
  end

end
