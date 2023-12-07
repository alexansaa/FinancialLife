require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @entity = FactoryBot.create(:entity, user: @user)
    @group = FactoryBot.create(:group, user: @user)
  end

  it 'is valid with attributes' do
    group_entity = FactoryBot.create(:group_entity, entity: @entity, group: @group)
    expect(group_entity).to be_valid
  end

  it 'is not valid without group' do
    group_entity = FactoryBot.create(:group_entity, entity: @entity)
    group_entity.group = nil
    expect(group_entity).not_to be_valid
  end

  it 'belongs to entity' do
    association = described_class.reflect_on_association(:entity)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to group' do
    association = described_class.reflect_on_association(:group)
    expect(association.macro).to eq(:belongs_to)
  end
end