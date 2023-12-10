require 'faker'

FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    icon { Faker::Internet.url }
    association :user, factory: :user

    transient do
      with_group_entities { false }
    end

    after(:create) do |mygroup, evaluator|
      create_list(:group_entities, 1, group: mygroup) if evaluator.with_group_entities
    end
  end
end
