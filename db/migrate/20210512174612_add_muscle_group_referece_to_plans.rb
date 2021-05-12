class AddMuscleGroupRefereceToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :muscle_group
    # , null: false, foreign_key: true
  end
end
