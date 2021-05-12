class AddClientRefereceToMuscleGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :muscle_groups, :client
    # , null: false, foreign_key: true
  end
end
