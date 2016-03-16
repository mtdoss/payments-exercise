class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    payment = Payment.new(payment_params)

    if payment.save
      render json: payment, status: :created
    else
      render(
        :json => payment.errors.full_messages,
        :status => :unprocessable_entity
      )
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:loan_id, :payment_amount)
  end
end
