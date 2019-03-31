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
