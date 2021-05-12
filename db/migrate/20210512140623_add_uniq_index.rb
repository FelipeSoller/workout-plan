class AddUniqIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :plans, :exercise, unique: true
  end
end
