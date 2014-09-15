class Category < ActiveRecord::Base
  has_many :blogs

  validates :name, :slug, presence: true

  def to_param
    slug
  end
end
