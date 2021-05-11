class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :exercise
      t.integer :sets
      t.integer :reps
      t.string :cadence
      t.integer :load
      t.integer :rest
      t.string :notes

      t.timestamps
    end
  end
end
