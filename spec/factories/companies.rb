# == Schema Information
#
# Table name: companies
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  before(:each) do
    @user = create(:user)
  end
  factory :company do
    name { Faker::Company.name }

    trait :with_user do
      before(:create) do |company|

        company.users << @user
        # company.company_users <<
      end
    end
  end
end
