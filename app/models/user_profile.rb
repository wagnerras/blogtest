class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :avatar, content_type: ['image/jpg', 'image/png', 'image/jpeg']
                                    
end