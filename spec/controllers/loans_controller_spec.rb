require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let!(:loan) { Loan.create!(funded_amount: 100.0) }

  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'displays outstanding balance' do
      get :index
      json = JSON.parse(response.body)
      expect(json.first.keys).to include('outstanding_balance')
    end
  end

  describe '#show' do
    it 'responds with a 200' do
      get :show, id: loan.id
      expect(response).to have_http_status(:ok)
    end

    it 'displays outstanding balance' do
      get :show, id: loan.id
      json = JSON.parse(response.body)
      expect(json.keys).to include('outstanding_balance')
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
