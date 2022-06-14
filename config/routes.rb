Rails.application.routes.draw do
  resources :competitions, only: %i[index show]
end
