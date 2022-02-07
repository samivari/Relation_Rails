Rails.application.routes.draw do
  get '/ski_resorts', to: 'ski_resorts#index'
  get '/ski_resorts/new', to: 'ski_resorts#new'
  get '/ski_resorts/:id', to: 'ski_resorts#show'
  get '/ski_runs', to: 'ski_runs#index'
  get '/ski_runs/:id', to: 'ski_runs#show'
  get 'ski_resorts/:ski_resort_id/ski_runs', to: 'ski_resort_runs#index'
  post '/ski_resorts', to: 'ski_resorts#create'
end
