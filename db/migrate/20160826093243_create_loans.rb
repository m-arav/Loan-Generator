class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :borrower_name
      t.integer :loan_number
      t.decimal :principal_loan_amount
      t.date :closing_date
      t.date :first_payment_date
      t.decimal :interest_rate
      t.decimal :term
      t.string :type

      t.timestamps
    end
  end
end
