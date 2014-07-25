class Contact < ActiveRecord::Base
  validates :name, :email, :message, presence: true
  validates :name, length: { maximum: 30 }
  # validate :check_email_validity

  def check_email_validity
    unless email =~ /^\\w[a-z0-9.]+@+\\w+.\\w+/i
      errors.add(:email, "enter a valid email address")
      return false
    end
  end
end
