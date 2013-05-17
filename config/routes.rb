I18nDashboard::Engine.routes.draw do

  match "/" => "translations#index", as: :i18n_dashboard_root
  resources :translations, only: [:index, :create, :destroy]

end
