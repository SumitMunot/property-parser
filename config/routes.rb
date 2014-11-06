Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :fetchers
      match 'room' => 'fetchers#room', via: [:get, :post], :defaults => { :format => :json }
    end
  end

  root to: 'visitors#index'
end
