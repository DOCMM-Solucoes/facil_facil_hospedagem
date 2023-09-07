# == Schema Information
#
# Table name: structures
#
#  id          :bigint           not null, primary key
#  description :text
#  images      :json
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Structure < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  validates :title, :description, :images, presence: true
end
