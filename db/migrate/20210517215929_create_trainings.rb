class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.references :student, foreign_key: true

      t.string :title

      t.timestamps
    end
  end
end
