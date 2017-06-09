class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.references :card, foreign_key: true
      t.references :gamer, foreign_key: true
      t.references :capacity, foreign_key: true

      t.timestamps
    end
  end
end
