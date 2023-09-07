# == Schema Information
#
# Table name: rooms
#
#  id                      :bigint           not null, primary key
#  description             :string
#  is_couple               :boolean
#  is_couple_plus_four     :boolean
#  is_couple_plus_one      :boolean
#  is_couple_plus_three    :boolean
#  is_couple_plus_two      :boolean
#  is_double               :boolean
#  is_quadruple            :boolean
#  is_quintuple            :boolean
#  is_sextuple             :boolean
#  is_single               :boolean
#  is_three_couples        :boolean
#  is_triple               :boolean
#  is_two_couples          :boolean
#  is_two_couples_plus_one :boolean
#  is_two_couples_plus_two :boolean
#  maximum_capacity        :integer
#  name                    :string
#  photo_1                 :string
#  photo_2                 :string
#  photo_3                 :string
#  photo_4                 :string
#  reference               :string
#  status                  :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Room < ApplicationRecord
	validates :name, :maximum_capacity, :status, presence: true
	validates :maximum_capacity, numericality: { only_integer: true }
	validate :at_least_one_accommodation_type_must_be_selected
	validate :at_least_one_option_single_double
	validate :at_least_one_image_attached

	has_many_attached :images, dependent: :destroy do |attachable|
		attachable.variant :thumb, resize: "200x200"
	end

	private
	def at_least_one_accommodation_type_must_be_selected
		unless is_double || is_triple || is_quadruple || is_quintuple || is_sextuple
			errors.add(:base, I18n.t('app.errors.type_of_accommodation'))
		end
	end

	def at_least_one_option_single_double
		unless is_single || is_couple || is_two_couples || is_three_couples
			errors.add(:base, I18n.t('app.errors.single_or_double'))
		end
	end

	def at_least_one_image_attached
		if images.blank?
			errors.add(:base, I18n.t('app.errors.photo attached'))
		end
	end
end
