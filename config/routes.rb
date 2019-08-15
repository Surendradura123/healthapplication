Rails.application.routes.draw do

  resources :transfers
root 'doctors#index'


  resources :shifteds do
    collection {post :import}
  end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/checkprice', :controller=>'patients', :action=>'checkprice'
  post '/validateprice', :controller=>'patients', :action=>'price'
  get 'patients/index'
  get 'patients/show'
  get 'patients/new'
  get 'patients/edit'
  get 'shifteds/index'
  get 'shifteds/show'
  get 'shifteds/new'
  get 'shifteds/edit'
get '/signedinuserdoctor'=>'doctors#signedinuserdoctor'
  resources :doctors do
      resources :patients
      collection do
        get:search # creates a new path for the search
      end


  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
