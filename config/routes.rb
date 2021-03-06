Rails.application.routes.draw do
  get '/ski_resorts', to: 'ski_resorts#index'
  get '/ski_resorts/:id/edit', to: 'ski_resorts#edit'
  get '/ski_resorts/new', to: 'ski_resorts#new'
  post '/ski_resorts', to: 'ski_resorts#create'
  get '/ski_resorts/:id', to: 'ski_resorts#show'
  patch '/ski_resorts/:id', to: 'ski_resorts#update'
  delete '/ski_resorts/:id', to: 'ski_resorts#destroy'

  get '/ski_runs', to: 'ski_runs#index'
  get '/ski_runs/:id', to: 'ski_runs#show'
  get '/ski_runs/:id/edit', to: 'ski_runs#edit'
  patch '/ski_runs/:id', to: 'ski_runs#update'
  delete '/ski_runs/:id', to: 'ski_runs#destroy'

  get '/ski_resorts/:ski_resort_id/ski_runs/new', to: 'ski_resort_runs#new'
  post '/ski_resorts/:ski_resort_id/ski_runs', to: 'ski_resort_runs#create'
  get '/ski_resorts/:ski_resort_id/ski_runs', to: 'ski_resort_runs#index'
end
