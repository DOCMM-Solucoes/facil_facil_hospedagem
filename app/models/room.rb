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
		  errors.add( :base, "At least one accommodation type must be selected")
		end
	end

	def at_least_one_option_single_double
		unless is_single || is_couple || is_two_couples || is_three_couples
  		errors.add( :base,"At least one option must be selected referring to the single or double room")
		end
	end

	def at_least_one_image_attached
		if images.blank?
			errors.add(:base, "At least one picture must be attached to the room")
		end
	end
end
