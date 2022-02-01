class CreateSkiResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ski_resorts do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :name
      t.integer :lifts
      t.boolean :backcountry_access
      t.integer :employee
      t.boolean :snowboarder_permitted
      t.integer :altitude
      t.integer :avg_snowfall
      t.string :location

      t.timestamps
    end
  end
end
