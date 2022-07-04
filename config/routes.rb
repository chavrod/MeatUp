Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :events do
    resources :attendance_records, only: %i[create destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "events#index"
end
