# frozen_string_literal: true

puts 'Seeding posts...' # rubocop:disable Rails/output

max_posts_per_user = 5

User.find_each do |user|
  iteration = rand(max_posts_per_user) + 1

  iteration.times { Post.create! content: Faker::Lorem.sentence, user_id: user.id }
end
