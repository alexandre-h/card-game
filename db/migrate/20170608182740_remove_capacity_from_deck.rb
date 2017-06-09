class RemoveCapacityFromDeck < ActiveRecord::Migration[5.0]
  def change
    remove_column :decks, :capacity_id
  end
end
