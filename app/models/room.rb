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
	validate :at_least_one_accommodation_type_must_be_selected
	validate :at_least_one_option_single_double

	has_many_attached :images, dependent: :destroy do |attachable|
		attachable.variant :thumb, resize: "200x200"
	end

	def at_least_one_accommodation_type_must_be_selected
		#return true if :is_double == true || :is_triple == true || :is_quadruple == true || :is_quintuple == true || :is_sextuple == true
		if :is_double == false and :is_triple == false and :is_quadruple == false and :is_quintuple == false and :is_sextuple == false
		  errors.add( :is_double, "At least one accommodation type must be selected")
		end
	end

	def at_least_one_option_single_double
		#return true if :is_single == true || :is_couple == true || :is_two_couples == true || :is_three_couples == true
		if :is_single == false and :is_couple == false and :is_two_couples == false and :is_three_couples == false
  		errors.add( :is_single,"At least one option must be selected referring to the single or double room")
		end
	end
end
