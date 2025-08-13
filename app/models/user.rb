class User < ApplicationRecord
  enum role: {
    user: "user",
    admin: "admin",
    manager: "manager"
  }

  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize if last_name.present?
  end

  def full_name
    [ first_name, last_name ].compact.join(" ")
  end
end
