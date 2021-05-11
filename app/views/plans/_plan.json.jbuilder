json.extract! plan, :id, :exercise, :sets, :reps, :cadence, :load, :rest, :notes, :created_at, :updated_at
json.url plan_url(plan, format: :json)
