class Category < ActiveRecord::Base
  has_many :blogs

  validates :name, presence: true
end
