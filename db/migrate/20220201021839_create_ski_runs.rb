class CreateSkiRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :ski_runs do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :name
      t.integer :distance
      t.boolean :open
      t.boolean :green
      t.boolean :blue
      t.boolean :black
      t.string :condition

      t.timestamps
    end
  end
end
