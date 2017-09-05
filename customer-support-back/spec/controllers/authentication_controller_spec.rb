require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe '#create' do
    before do
      expect(AuthenticateUser).to receive(:call).once.and_return(context)
    end

    context 'when successful' do
      let(:user)    { double(:user, id: 1) }
      let(:context) { double(:context, success?: true, user: user, 
        token: 'token') }

      it "returns the user's secret token in the headers" do
        expect {
          post :authenticate, params: { email: 'john@doe.com', password: 'secret' }
        }.to change {
          response.headers['Authorization']
        }.from(nil).to('token')
      end

      it 'returns successful status' do
        post :authenticate, params: { email: 'john@doe.com', password: 'secret' }
        expect(response.status).to eq(200)
      end
    end

    context 'when unsuccessful' do
      let(:context) { double(:context, success?: false, message: '') }

      it 'returns unsuccessful status' do
        post :authenticate, params: { email: 'john@doe.com', password: 'secret' }
        expect(response.status).to eq(401)
      end
    end
  end
end
