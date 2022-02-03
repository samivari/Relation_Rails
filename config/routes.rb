Rails.application.routes.draw do
  get '/ski_resorts', to: 'ski_resorts#index'
  get '/ski_resorts/:id', to: 'ski_resorts#show'
  get '/ski_runs', to: 'ski_runs#index'
end
