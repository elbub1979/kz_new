# frozen_string_literal: true

class User < ApplicationRecord
  has_many :internal_phones
  # has_many :data_carriers, class_name: 'DSP::DataCarrier'

  validates :lname, presence: true

  def full_name
    pname.nil? ? "#{lname} #{fname}" : "#{lname} #{fname} #{pname}"
  end

  def hidden?
    hidden
  end
end
