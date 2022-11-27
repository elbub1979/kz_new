# frozen_string_literal: true

class User < ApplicationRecord
  # has_many :internal_phones
  # has_many :dsp_data_carriers, class_name: 'Dsp::DataCarrier'

  has_many :employees
  has_many :departments, through: :employees

  validates :lname, presence: true

  def full_name
    pname.nil? ? "#{lname} #{fname}" : "#{lname} #{fname} #{pname}"
  end

  def hidden?
    hidden
  end
end
