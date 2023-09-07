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
  validate :company_presence_with_cnpj
  validate :valid_cpf_or_cnpj

  private

  def cpf_or_cnpj_present
    unless cpf.present? || cnpj.present?
      errors.add(:base, I18n.t('app.errors.cpf_or_cnpj_presence'))
    end
  end

  def company_presence_with_cnpj
    if cnpj.present? && company.blank?
      errors.add(:base, I18n.t('app.errors.company_presence_with_cnpj'))
    end
  end

  def valid_cpf_or_cnpj
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:base, I18n.t('app.errors.invalid_cpf'))
    end

    if cnpj.present? && !CNPJ.valid?(cnpj)
      errors.add(:base, I18n.t('app.errors.invalid_cnpj'))
    end
  end
end
