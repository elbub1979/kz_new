class Employee < ApplicationRecord
  has_many :internal_phones
  has_many :dsp_data_carriers, class_name: 'Dsp::DataCarrier'

  belongs_to :user
  belongs_to :department
end
