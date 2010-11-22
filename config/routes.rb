TddCleanStart::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  devise_for :people
  devise_for :admins

  root :to => "welcome#index"

end
