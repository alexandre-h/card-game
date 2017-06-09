class RemoveCapaictyFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :capacity
  end
end
