# == Schema Information
#
# Table name: users
#
#  id                         :bigint(8)        not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  first_name                 :string
#  last_name                  :string
#  announcements_last_read_at :datetime
#  admin                      :boolean          default(FALSE)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

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

  describe '.is_job_seeker?' do
    let(:new_user) {attributes_for(:user)}
    it 'is a job seeker' do
      user = User.create new_user
      expect(user.is_job_seeker?).to eq(true)
    end
  end

  describe '.employer?' do
    let(:new_user) {attributes_for(:user)}
    it 'is an employer' do
      user_with_company = new_user.merge({"companies_attributes" => {"0" => attributes_for(:company)}})
      user = User.create user_with_company
      expect(user.is_employer?).to eq(true)
    end
  end
end
