class Article < ActiveRecord::Base
    belongs_to :user
    has_many :replies, :dependent => :destroy

    has_one_attached :anexo

    paginates_per 5
     
    validates :title, presence: true, length: { minimum: 1, maximum: 30 }
    validates :description, presence: true,  length: { minimum: 1, maximum: 5000}
    validates :user_id, presence: true

    validates :anexo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

    scope :_search_, ->(page, term){
        includes(:user)
        .where("lower(title) LIKE ? or lower(description) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%")
        .page(page)
    }
end