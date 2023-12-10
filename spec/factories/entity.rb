require 'faker'

FactoryBot.define do
  factory :entity do
    name { Faker::Name.name }
    amount { Faker::Number.number(digits: 2) }
    association :user, factory: :user

    transient do
      with_group_entities { false }
    end

    after(:create) do |my_entity, evaluator|
      create_list(:group_entity, 1, entity: my_entity) if evaluator.with_group_entities
    end
  end
end
