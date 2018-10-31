class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags#, :join_table => :tags_posts
end
