require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { FactoryGirl.create(:user) }

  describe '.call' do
    context 'when given valid credentials' do
      subject(:context) { AuthenticateUser.call(email: user.email, 
        password: 'password') }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the user' do
        expect(context.user).to eq(user)
      end

      it "provides the user's secret token" do
        expect(context.token).not_to be_nil
      end
    end

    context 'when given invalid credentials' do
      subject(:context) { AuthenticateUser.call(email: user.email, 
        password: 'invalid') }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.message).to be_present
      end
    end
  end
end
