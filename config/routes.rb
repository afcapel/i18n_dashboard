I18nDashboard::Engine.routes.draw do

  root to: "translations#index"
  resources :translations, only: [:index, :create, :destroy]

end
