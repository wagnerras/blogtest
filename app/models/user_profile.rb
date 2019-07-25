class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :avatar, content_type: ['image/jpg', 'image/png', 'image/jpeg']
  validates :name, presence: true, length: { minimum: 3 }, on: :update, unless: :reset_password_token_present?

  def reset_password_token_present?
    !!$global_params[:user][:reset_password_token]
  end

                                    
end