class Payment < ActiveRecord::Base
  belongs_to :loan

  validate :dont_exceed_balance_of_loan

  def dont_exceed_balance_of_loan
    if payment_amount > loan.outstanding_balance
      errors.add(:payment_amount, "Cant exceed balance of loan")
    end
  end
end
