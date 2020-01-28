Rails.application.routes.draw do

  devise_for :users
  resources :servicos do
    collection do
      get :pagina_inicial
      get :descricao
      get :ativos
    end
  end
  	
  root to: 'servicos#pagina_inicial'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
