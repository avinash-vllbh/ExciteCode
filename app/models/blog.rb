class Blog < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title, :body, :keywords, :category_id, :slug, presence: true

  def to_param
    slug
  end
end
