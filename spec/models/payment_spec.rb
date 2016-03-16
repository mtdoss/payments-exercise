require 'rails_helper'

RSpec.describe Payment do
  let(:loan) { Loan.create!(funded_amount: 25.0) }

  describe "validations" do
    it 'should not allow payment to exceed balance of loan' do
      payment = Payment.create(loan_id: loan.id, payment_amount: 50.0)
      expect(payment).to be_invalid
      expect(payment.errors.keys).to include(:payment_amount)
    end
  end
end
