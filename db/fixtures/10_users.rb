# frozen_string_literal: true

puts 'Seeding users...' # rubocop:disable Rails/output

num_users = 10

# user for dev
User.create! name: 'tom', email: 'tom@tom.com', password: 'tomtom'

num_users.times do
  User.create! name: Faker::Name.first_name, email: Faker::Internet.email, password: 'sample123'
end
