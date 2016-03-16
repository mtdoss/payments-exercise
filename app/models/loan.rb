class Loan < ActiveRecord::Base
  has_many :payments

  def outstanding_balance
    total_payment_amount = payments.sum(:payment_amount) || 0

    funded_amount - total_payment_amount
  end
end
