require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 100.0) }
  let(:payment) { Payment.create!(loan_id: loan.id, payment_amount: 100.0) }

  describe '#index' do
    it 'responds with a 200' do
      get :index, loan_id: loan.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end

    context 'when payment is not found' do
      it 'responds with a 404' do
        get :show, id: 9999
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "#create" do
    context 'when payment succeeds' do
      let(:create_params) {{payment: { format: :json, loan_id: loan.id,
                                       payment_amount: 50.0 }}}

      it 'creates a payment for a given loan' do
        post :create, create_params
        expect(response).to be_success
      end
    end

    context 'when payment fails' do
      let(:create_params) {{payment: { format: :json, loan_id: loan.id,
                                       payment_amount: 200.0 }}}
      it 'returns status as unprocessable_entity' do
        post :create, create_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
