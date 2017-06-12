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
  get 'games/played_card/card_one/:card_one/card_two/:card_two', to: 'games#played_card'

  resources :game_histories do
    get 'gamer_all_history', on: :member
    get 'gamer_victory_history', on: :member
    get 'gamer_defeat_history', on: :member
  end
end
