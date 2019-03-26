require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#save' do
    let(:new_user) {attributes_for(:user)}
    context 'when all validations pass' do
      it 'responds with 200' do
        user = User.new new_user
        expect(user.save).to eq(true)
      end
    end

    context 'when it is not going to create a new user' do
      it 'provided existing email address' do
        User.create(new_user)

        user = User.new new_user
        expect(user.save).to eq(false)
      end


      it 'provided passwords that do not match' do
        user = build(:user, password_confirmation: "not matching password")
        expect(user.save).to eq(false)
      end

      it 'provided missing information' do
        user = build(:user, email: nil, name: nil)
        expect(user.save).to eq(false)
      end
    end
  end
end
