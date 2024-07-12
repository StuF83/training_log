class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.string :workout_type
      t.integer :duration
      t.string :intensity
      t.date :date

      t.timestamps
    end
  end
end
