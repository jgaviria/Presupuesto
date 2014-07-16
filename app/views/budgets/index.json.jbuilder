json.array!(@budgets) do |budget|
  json.extract! budget, :id, :income, :savings, :housing, :utilities, :food, :food, :transportation, :clothing, :personal, :recreation, :debt, :kids
  json.url budget_url(budget, format: :json)
end
