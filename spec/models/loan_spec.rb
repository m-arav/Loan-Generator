require 'rails_helper'

RSpec.describe Loan, type: :model do
  subject { Loan.new(borrower_name: 'Aravind', loan_number: 1, principal_loan_amount: 200, closing_date: Date.new(2007, 5, 12), first_payment_date: Date.new(2006, 5, 12), interest_rate: 2, term: 1, type_of_loan: "Credit Builder Loan"  ) }

  context "Validations :" do
    it 'Validates data' do
      expect(subject).to be_valid
    end
    it 'is invalid without a name' do
      subject.borrower_name = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without loan number' do
      subject.loan_number = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without principal_loan_amount' do
      subject.principal_loan_amount = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without closing_date' do
      subject.closing_date = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without first_payment_date' do
      subject.first_payment_date = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without interest_rate' do
      subject.interest_rate = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid without term' do
      subject.term = nil
      expect(subject).to_not be_valid
    end
    it 'is invlaid type_of_loan' do
      subject.type_of_loan = "anything else"
      expect(subject).to_not be_valid
    end
  end

end
