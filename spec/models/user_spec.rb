require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with attributes' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user = FactoryBot.create(:user)
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'has many groups (categories)' do
    association = described_class.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many entities (transactions)' do
    association = described_class.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
  end

end
