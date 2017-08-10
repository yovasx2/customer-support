require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_length_of(:password_digest).is_at_most(255) }
  end

  it 'valid factory' do
    account = FactoryGirl.build(:user)
    expect(account).to be_valid
  end
end
