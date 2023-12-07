require 'faker'

FactoryBot.define do
  factory :entity do
    name { Faker::Name.name }
    amount { Faker::Number.number(digits: 2) }
    association :user, factory: :user

    transient do
      with_group_entities { false }
    end

    after(:create) do |evaluator|
      create_list(:group_entities, 1, entity) if evaluator.with_group_entities
    end
  end
end
