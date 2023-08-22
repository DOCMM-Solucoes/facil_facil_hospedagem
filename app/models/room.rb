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
	has_many_attached :images, dependent: :destroy do |attachable|
		attachable.variant :thumb, resize: "200x200"
	end
end
