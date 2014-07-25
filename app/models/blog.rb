class Blog < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title, :body, :keywords, :category, presence: true
end
