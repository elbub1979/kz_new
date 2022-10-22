class User < ApplicationRecord
  has_many :internal_phones

  validates :fname, :lname, presence: true

  def full_name
    full_name = "#{lname} #{fname}"
    full_name += " #{pname}" unless pname.nil?
  end
end
