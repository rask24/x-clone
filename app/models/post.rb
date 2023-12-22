# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reply_to_id :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_reply_to_id  (reply_to_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (reply_to_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user

  with_options class_name: 'Post' do
    has_many :replies, foreign_key: :reply_to_id, dependent: :nullify, inverse_of: :parent_post
    belongs_to :parent_post, optional: true
  end
end
