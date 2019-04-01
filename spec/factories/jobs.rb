# == Schema Information
#
# Table name: jobs
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  company_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyText" }
  end
end
