# == Schema Information
#
# Table name: guides
#
#  id         :bigint           not null, primary key
#  cnpj       :string
#  company    :string
#  cpf        :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Guide < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :trips, dependent: :destroy
  has_many :establishments, through: :trips
  validates :name, presence: true
  validates :phone, presence: true
  validate :cpf_or_cnpj_present

  private

  def cpf_or_cnpj_present
    unless cpf.present? || cnpj.present?
      errors.add(:base, I18n.t('activerecord.errors.models.guide.attributes.base.cpf_or_cnpj_presence'))
    end
  end
end
