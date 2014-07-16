class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :income
      t.decimal :savings
      t.decimal :housing
      t.decimal :utilities
      t.decimal :food
      t.decimal :food
      t.decimal :transportation
      t.decimal :clothing
      t.decimal :personal
      t.decimal :recreation
      t.decimal :debt
      t.decimal :kids

      t.timestamps
    end
  end
end
