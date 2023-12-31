class ProyectUser < ApplicationRecord
  ROLE = %i[member administrator owner]
  public_constant :ROLE
  enum role: ROLE

  validates :role, uniqueness: { scope: :proyect_id }, if: -> { owner? }
  validates :user_id, uniqueness: { scope: :proyect_id }, on: :create

  belongs_to :user
  belongs_to :proyect

  scope :owners, -> { where(role: :owner) }
  scope :administrators, -> { where(role: :administrator) }
  scope :members, -> { where(role: :member) }
end
