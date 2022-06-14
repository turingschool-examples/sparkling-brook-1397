Rails.application.routes.draw do
  resources :competitions, only: %i[index show] do
    resources :teams, only: [:new]
  end
end
