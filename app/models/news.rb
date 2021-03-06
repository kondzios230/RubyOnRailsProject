class News < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  has_many :coments, dependent: :destroy

end
