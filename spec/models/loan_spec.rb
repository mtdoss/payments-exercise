require 'rails_helper'

RSpec.describe Loan do
  describe "#outstanding_balance" do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:payment) { Payment.create!(loan_id: loan.id, payment_amount: 25.0) }
    let(:payment2) { Payment.create!(loan_id: loan.id, payment_amount: 10.0) }

    it 'should equal the sum of all payment amounts for associated payments' do
      expected_amount = loan.funded_amount -
                        (payment.payment_amount + payment2.payment_amount)
      expect(loan.outstanding_balance).to eq(expected_amount)
    end
  end
end
