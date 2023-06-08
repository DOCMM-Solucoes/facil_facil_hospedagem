class Trip < ApplicationRecord
  belongs_to :establishment
  belongs_to :guide
end
