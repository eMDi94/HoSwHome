class CreateSensors < ActiveRecord::Migration[7.1]
  def change
    create_table :sensors do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :sensors, :code, unique: true
  end
end
