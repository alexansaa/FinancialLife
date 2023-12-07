class GroupEntity < ApplicationRecord
  validates :group_id, presence: true
  validates :entity_id, presence: true
  belongs_to :group
  belongs_to :entity
end
