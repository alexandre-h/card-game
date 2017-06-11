Rails.application.routes.draw do
  get 'cards/index'

  get 'cards/show'

  resources :gamers do
    get 'information', on: :member
    get 'show_cards', on: :member
  end

  resources :cards do
    get 'index', on: :member
    get 'show', on: :member
  end
end
