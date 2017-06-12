class CreateGameHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :game_histories do |t|
      t.references :winner, references: :gamers
      t.references :loser, references: :gamers
      t.references :winner_card, references: :cards
      t.references :loser_card, references: :cards
      t.string :description
      t.timestamps
    end
  end
end
