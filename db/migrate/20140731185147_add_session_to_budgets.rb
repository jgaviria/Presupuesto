class AddSessionToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :session, :string
  end
end
