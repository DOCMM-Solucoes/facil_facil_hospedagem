# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  images     :json
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  has_many_attached :images, dependent: :destroy
end
