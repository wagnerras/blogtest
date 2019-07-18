class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :description, presence: true,  length: { minimum: 1, maximum: 1000 }
  validates :user_id, presence: true
  validates :article_id, presence: true
end
