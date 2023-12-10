# Seed Users
user1 = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123')
user2 = User.create!(name: 'Jane Smith', email: 'jane@example.com', password: 'password456')

# Seed Entities
entity1 = user1.entities.create!(name: 'Entity 1', amount: 1000)
entity2 = user1.entities.create!(name: 'Entity 2', amount: 1500)
entity3 = user2.entities.create!(name: 'Entity 3', amount: 800)

# Seed Groups
group1 = user1.groups.create!(name: 'Group A', icon: 'icon1')
group2 = user2.groups.create!(name: 'Group B', icon: 'icon2')

# Seed Entity-Group Relationships
GroupEntity.create!(group: group1, entity: entity1)
GroupEntity.create!(group: group1, entity: entity2)
GroupEntity.create!(group: group2, entity: entity3)
