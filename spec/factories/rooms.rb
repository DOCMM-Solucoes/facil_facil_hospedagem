# frozen_string_literal: true

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