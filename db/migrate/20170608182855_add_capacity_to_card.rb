class AddCapacityToCard < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :capacity, index: true
  end
end
