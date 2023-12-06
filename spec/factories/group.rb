require 'faker'

FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    icon { Faker::Internet.url }
    association :user, factory: :user

    transient do
      with_group_entities { false }
    end

    after(:create) do |group, evaluator|
      create_list(:group_entities, 1, group: group) if evaluator.with_group_entities
    end
  end
end
