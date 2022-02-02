class AddSkiResortToSkiRun < ActiveRecord::Migration[5.2]
  def change
    add_reference :ski_runs, :ski_resort, foreign_key: true
  end
end
