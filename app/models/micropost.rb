class Micropost < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks
  has_many :bookmarking_users, through: :bookmarks, source: :user

  mount_uploader :photo, PhotoUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def add_bookmark(user)
    bookmarks.find_or_create_by(user_id: user.id)
  end

  def delete_bookmark(user)
    bookmark = bookmarks.find_by(user_id: user.id)
    bookmark.destroy if bookmark
  end

  def bookmarked_by?(user)
    bookmarking_users.include?(user)
  end
end
