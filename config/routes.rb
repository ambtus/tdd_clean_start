TddCleanStart::Application.routes.draw do
  # See how all your routes lay out with "rake routes"
  # first match: /edit and /new must come before /:id

  root :to => "welcome#index"
  # root_path / {:controller=>"welcome", :action=>"index"}

  # authentication for users
  devise_for :users
  # sign in & out
  # new_user_session_path GET /users/sign_in {:action=>"new", :controller=>"devise/sessions"}
  # user_session_path POST /users/sign_in {:action=>"create", :controller=>"devise/sessions"}
  # destroy_user_session_path GET /users/sign_out {:action=>"destroy", :controller=>"devise/sessions"}

  # :recoverable (forgot password, and reset after)
  # user_password_path POST /users/password {:action=>"create", :controller=>"devise/passwords"}
  # new_user_password_path GET /users/password/new {:action=>"new", :controller=>"devise/passwords"}
  # edit_user_password_path GET /users/password/edit {:action=>"edit", :controller=>"devise/passwords"}
  # user_password_path PUT /users/password {:action=>"update", :controller=>"devise/passwords"}

  # :registerable (sign up, edit & leave)
  # user_registration_path POST /users {:action=>"create", :controller=>"devise/registrations"}
  # new_user_registration_path GET /users/sign_up {:action=>"new", :controller=>"devise/registrations"}
  # edit_user_registration_path GET /users/edit {:action=>"edit", :controller=>"devise/registrations"}
  # user_registration_path PUT /users {:action=>"update", :controller=>"devise/registrations"}
  # user_registration_path DELETE /users {:action=>"destroy", :controller=>"devise/registrations"}

  # :confirmable (must have real email address)
  # user_confirmation_path POST /users/confirmation {:action=>"create", :controller=>"devise/confirmations"}
  # new_user_confirmation_path GET /users/confirmation/new {:action=>"new", :controller=>"devise/confirmations"}
  # user_confirmation_path GET /users/confirmation {:action=>"show", :controller=>"devise/confirmations"}

  # :lockable (reset after locked out)
  # user_unlock_path POST /users/unlock {:action=>"create", :controller=>"devise/unlocks"}
  # new_user_unlock_path GET /users/unlock/new {:action=>"new", :controller=>"devise/unlocks"}
  # user_unlock_path GET /users/unlock {:action=>"show", :controller=>"devise/unlocks"}

  # authentication for admins
  devise_for :admins
  # same paths as above except with "admin" instead of "user"

  # routes for managing my identities
  resource :identities, :only => [:new, :create, :edit, :update]
  # identities_path POST /identities {:action=>"create", :controller=>"identities"}
  # new_identities_path GET /identities/new {:action=>"new", :controller=>"identities"}
  # edit_identities_path GET /identities/edit {:action=>"edit", :controller=>"identities"}
  # identities_path PUT /identities {:action=>"update", :controller=>"identities"}

  # routes for browsing identities and their works
  resources :identities, :only => [:index, :show] do
    resources :works, :only => [:index]
  end
  # identity_works_path GET /identities/:identity_id/works {:action=>"index", :controller=>"works"}
  # identities_path GET /identities {:action=>"index", :controller=>"identities"}
  # identity_path GET /identities/:id {:action=>"show", :controller=>"identities"}

  # routes for managing my works in bulk
  resource :works, :only => [:edit, :update]
  # edit_works_path GET /works/edit {:action=>"edit", :controller=>"works"}
  # works_path PUT /works {:action=>"update", :controller=>"works"}

  # routes for browsing works
  resources :works, :only => [:index]
  # works_path GET /works {:action=>"index", :controller=>"works"}

  # routes for creating a new work
  resource :works, :only => [:new, :create]
  # works_path POST /works {:action=>"create", :controller=>"works"}
  # new_works_path GET /works/new {:action=>"new", :controller=>"works"}

  # routes for reading a work:
  resources :works, :only => [:show] do
    resources :chapters, :only => [:index, :show]
  end
  # work_chapters_path GET /works/:work_id/chapters {:action=>"index", :controller=>"chapters"}
  # work_chapter_path GET /works/:work_id/chapters/:id {:action=>"show", :controller=>"chapters"}
  # work_path GET /works/:id {:action=>"show", :controller=>"work"}

  # routes for editing a work and managing its chapters
  resources :works, :only => [:edit, :update] do
    resources :chapters, :only => [:new, :create, :edit, :update, :destroy]
  end
  # work_chapters_path POST /works/:work_id/chapters {:action=>"create", :controller=>"chapters"}
  # new_work_chapter_path GET /works/:work_id/chapters/new {:action=>"new", :controller=>"chapters"}
  # edit_work_chapter_path GET /works/:work_id/chapters/:id/edit {:action=>"edit", :controller=>"chapters"}
  # work_chapter_path PUT /works/:work_id/chapters/:id {:action=>"update", :controller=>"chapters"}
  # work_chapter_path DELETE /works/:work_id/chapters/:id {:action=>"destroy", :controller=>"chapters"}
  # edit_work_path GET /works/:id/edit {:action=>"edit", :controller=>"work"}
  # work_path PUT /works/:id {:action=>"update", :controller=>"work"}

end
