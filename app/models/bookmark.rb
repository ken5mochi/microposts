class Bookmark < ActiveRecord::Base
  validates :user, presence: true
  validates :micropost, presence: true
  validates :user_id, uniqueness: { scope: :micropost_id }

  belongs_to :user
  belongs_to :micropost
end
