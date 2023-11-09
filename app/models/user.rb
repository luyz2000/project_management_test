class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :proyect_users
  has_many :proyects, through: :proyect_users
  # with this we can login and register users withount password(project requirement)
  def password_required?
    false
  end

  def generate_login_token!
    update_column(:login_token, SecureRandom.uuid)
  end
end
