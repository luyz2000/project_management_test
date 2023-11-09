class Proyect < ApplicationRecord
  STATUSES = %i[inactive progress review release]
  public_constant :STATUSES
  enum status: STATUSES

  has_many :proyect_users
  has_many :users, through: :proyect_users

  accepts_nested_attributes_for :proyect_users

  has_one :owners_proyect_users, -> { owners }, class_name: 'ProyectUser'
  has_many :admin_proyect_users, -> { administrators }, class_name: 'ProyectUser'
  has_many :members_proyect_users, -> { members }, class_name: 'ProyectUser'

  has_one :owner, through: :owners_proyect_users, source: :user
  has_many :admins, through: :admin_proyect_users, source: :user
  has_many :members, through: :members_proyect_users, source: :user
end
