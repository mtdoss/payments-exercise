class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :payment_amount, precision: 8, scale: 2, null: false
      t.integer :loan_id, null: false

      t.timestamps null: false
    end
  end
end
