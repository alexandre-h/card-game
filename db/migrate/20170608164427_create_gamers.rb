class CreateGamers < ActiveRecord::Migration[5.0]
  def change
    create_table :gamers do |t|
      t.string :name

      t.timestamps
    end
  end
end
