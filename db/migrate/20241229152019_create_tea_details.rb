class CreateTeaDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :tea_details do |t|
      t.integer :infusion_time
      t.integer :infusion_temperature
      t.string :time_of_day
      t.float :dosage

      t.timestamps
    end
  end
end
