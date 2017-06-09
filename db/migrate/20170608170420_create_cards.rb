class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :attack
      t.integer :defense
      t.references :category
      t.timestamps
    end
  end
end
