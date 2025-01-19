class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :latin_name
      t.string :traditional_qualities
      t.string :description
      t.string :part_used

      t.timestamps
    end
  end
end
