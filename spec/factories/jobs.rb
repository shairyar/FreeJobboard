FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyText" }
    company { "MyString" }
    belongs_to { "MyString" }
  end
end
