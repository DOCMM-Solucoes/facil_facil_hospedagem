class Address < ApplicationRecord
  belongs_to :hotelier
  belongs_to :establishment
  belongs_to :guide
end
