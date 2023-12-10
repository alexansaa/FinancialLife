require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with attributes' do
    group = FactoryBot.create(:group, user: @user)
    expect(group).to be_valid
  end

  it 'is not valid without name' do
    group = FactoryBot.create(:group, user: @user)
    group.name = nil
    expect(group).not_to be_valid
  end

  it 'belongs to user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many group_entities' do
    association = described_class.reflect_on_association(:group_entities)
    expect(association.macro).to eq(:has_many)
  end
end
