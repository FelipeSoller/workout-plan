json.extract! exercise, :id, :name, :sets, :reps, :rest, :muscle_group, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
