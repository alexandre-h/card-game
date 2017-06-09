class CreateCapacities < ActiveRecord::Migration[5.0]
  def change
    create_table :capacities do |t|
      t.string :kind

      t.timestamps
    end
  end
end
