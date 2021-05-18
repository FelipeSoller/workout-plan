class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.references :teacher, foreign_key: true

      t.string :name

      t.timestamps
    end
  end
end
