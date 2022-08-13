FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Sample article #{n}" }
    # sequence(:author) { |n| "The content of my awesome article #{n}" }
    association :author
  end
end
