# frozen_string_literal: true

class User < ApplicationRecord
  has_many :internal_phones
  before_save :capitalize_name

  validates :fname, :lname, presence: true

  def full_name
    pname.nil? ? "#{lname} #{fname}" : "#{lname} #{fname} #{pname}"
  end

  private

  def capitalize_name
    fname.capitalize!
    lname.capitalize!
    pname&.capitalize!
  end
end
