class Blog < ActiveRecord::Base
  has_many :comments
  belongs_to :category

  validates :title, :body, :keywords, :category, presence: true
end
