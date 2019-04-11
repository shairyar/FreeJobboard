FactoryBot.define do
  factory :address do
    contact_number { "" }
    line_1 { "" }
    line_2 { "MyString" }
    type { "" }
  end
end
