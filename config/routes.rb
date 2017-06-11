Rails.application.routes.draw do

  resources :gamers do
    get 'information', on: :member
    get 'show_cards', on: :member
  end

  resources :cards do
    get 'index', on: :member
    get 'show', on: :member
  end

  get 'games/fight/:gamer_one/:gamer_two', to: 'games#fight'
end
