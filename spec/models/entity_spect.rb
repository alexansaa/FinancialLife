require 'rails_helper'

RSpec.describe Entity, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with attributes' do
    entity = FactoryBot.create(:entity, user: @user)
    expect(entity).to be_valid
  end

  it 'is not valid without a user how owns it' do
    entity = FactoryBot.create(:entity)
    expect(entity).not_to be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many group_entities' do
    association = described_class.reflect_on_association(:group_entity)
    expect(association.macro).to eq(:has_many)
  end
end