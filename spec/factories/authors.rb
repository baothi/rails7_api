FactoryBot.define do
  factory :author do
    # first_name { "MyString" }
    # last_name { "MyString" }
    # age { 1 }
    sequence(:first_name) { |n| "Sample article #{n}" }
    sequence(:last_name) { |n| "The content of my awesome article #{n}" }
    sequence(:age) { |n| "#{n}" }
  end
end
