class CreateMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :measurements do |t|
      t.references :sensor, null: false, foreign_key: true
      t.float :value, null: false

      t.timestamps
    end
  end
end
