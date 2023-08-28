# frozen_string_literal: true

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
FactoryBot.define do
  sequence :names do |n|
    "Room ##{n}"
  end

  sequence :descriptions do |n|
    "Room / Apto. ##{n}"
  end  

  factory :room do
    name { generate(:names) }
    description { generate(:descriptions) }
    reference { 'Andar X - Bloco Y' }
    maximum_capacity { 6 }
    status { 'A' }
		is_double { true } 
		is_triple { true }  
		is_quadruple { true } 
		is_quintuple { true } 
		is_sextuple { true } 
		is_single { true } 
		is_couple { true } 
		is_couple_plus_one { true } 
		is_couple_plus_two { true } 
		is_couple_plus_three { true } 
		is_couple_plus_four { true }  
		is_two_couples { true } 
		is_two_couples_plus_one { true } 
		is_two_couples_plus_two { true } 
		is_three_couples { true }
  end
end
