Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:index, :show] do
    resources :entries, except: [:index]
  end

  namespace :api do
    namespace :v1 do
      put 'report_status', to: 'volunteers#report_status'
    end
  end

end
