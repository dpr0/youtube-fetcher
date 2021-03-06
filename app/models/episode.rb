class Episode < ApplicationRecord
  belongs_to :podcast
  mount_uploader :media, MediaUploader

  validates :title, presence: true
  validates :published_at, presence: true

  def size
    media.size
  end

  def url
    media.url
  end
end
