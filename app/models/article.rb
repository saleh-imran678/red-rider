class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, :author, :category, :published_at, presence: true

  def as_api_json
    as_json(only: [:id, :title, :content, :author, :category, :published_at])
  end
end