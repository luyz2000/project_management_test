class Proyect < ApplicationRecord
  STATUSES = %i[inactive progress review release]
  public_constant :STATUSES
  enum status: STATUSES
end
