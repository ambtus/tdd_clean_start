TddCleanStart::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  devise_for :people

  resources :people, :only => [] do
    resource :identities
  end

  devise_for :admins

  root :to => "welcome#index"

  resources :identities
end
