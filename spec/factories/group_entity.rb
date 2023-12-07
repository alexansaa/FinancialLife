require 'faker'

FactoryBot.define do
  factory :group_entity do
    association :group, factory: :group
    association :entity, factory: :entity
  end
end
