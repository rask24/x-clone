# frozen_string_literal: true

class AddReplyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :reply_to, foreign_key: { to_table: :posts }
  end
end
