# frozen_string_literal: true

class User < ApplicationRecord
  has_many :internal_phones

  validates :fname, :lname, presence: true

  def full_name
    pname.nil? ? "#{lname} #{fname}" : "#{lname} #{fname} #{pname}"
  end
end
