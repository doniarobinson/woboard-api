class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :worktype
      t.datetime :occurred
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
