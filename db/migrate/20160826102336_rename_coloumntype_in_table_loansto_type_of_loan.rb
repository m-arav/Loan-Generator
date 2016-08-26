class RenameColoumntypeInTableLoanstoTypeOfLoan < ActiveRecord::Migration[5.0]
  def change
	rename_column :loans, :type, :type_of_loan
  end
end
