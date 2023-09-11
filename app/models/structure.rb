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

private

def validate_presence_of(attribute, error_message)
  unless send(attribute).present?
    errors.add(:base, i18n.t('errors.#{error_message}'))
  end
end

def at_least_one_described_title
  validate_presence_of(:title, 'type_of_title')
end

def at_least_a_written_description
  validate_presence_of(:description, 'type_of_description')
end

def at_least_one_attached_image
  validate_presence_of(:images, 'photo_attached')
end