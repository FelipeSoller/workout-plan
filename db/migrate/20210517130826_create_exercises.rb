class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.references :training, foreign_key: true

      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :rest
      t.string :muscle_group

      t.timestamps
    end
  end
end
