class Loan < ApplicationRecord
  validates :borrower_name, :first_payment_date, :closing_date, presence: true
  validates :loan_number, :principal_loan_amount, :interest_rate, :term, numericality: { greater_than: 0}
  validates :type_of_loan, inclusion: { in: %w(Business\ Loan Credit\ Builder\ Loan) }
  validate :closing_date_after_first_payment


  def monthly_payment
      monthly_rate = self.interest_rate / 1200.0
      a = monthly_rate * self.principal_loan_amount
      b = 1 - (1 + monthly_rate)**(-self.term)
      annuity = (a / b).round(2)
  end

  def generate_schedule
      schedule = []
      monthly_payment_amount = monthly_payment
      balance = self.principal_loan_amount
      next_payment_date = self.closing_date >> 1
      for month in 1..self.term
        next_payment_date = next_payment_date >> 1
        monthly_schedule = {}
        monthly_schedule["balance"] = balance
        monthly_schedule["next_payment_date"] = next_payment_date
        monthly_schedule["principal_payment"] = (monthly_schedule["balance"]- monthly_payment_amount).round(2)
        balance = (balance - monthly_schedule["principal_payment"]).round(2)
        monthly_schedule["end_balance"] = balance
        schedule << monthly_schedule
      end
      schedule
  end

  private

  def closing_date_after_first_payment

    return if closing_date.blank? || first_payment_date.blank?

    if closing_date < first_payment_date
      errors.add(:closing_date, "must be after the start date")
    end
  end

end
