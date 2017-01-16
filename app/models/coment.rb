class Coment < ApplicationRecord
  belongs_to :user
  belongs_to :news
  validates :content, presence: true
  validates :news_id, presence: true
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
end
