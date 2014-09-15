class Project < ActiveRecord::Base
  before_save :add_slug

  validates :title, presence: true
  validates :description, presence: true
  validates :language, presence: true

  def add_slug
    self.slug = self.title.downcase.gsub(" ", "-")
  end
end
