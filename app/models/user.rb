class User < ApplicationRecord
  has_many :articles, :dependent => :destroy
  has_one :user_profile, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
