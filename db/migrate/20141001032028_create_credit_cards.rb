class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.integer :total
      t.integer :paid
      t.integer :subtotal
      t.string :paymentmethod
      t.string :username
      t.string :password
      t.integer :limit
      t.integer :ratio

      t.timestamps
    end
  end
end
