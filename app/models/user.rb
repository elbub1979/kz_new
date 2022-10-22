class User < ApplicationRecord
  has_many :internal_phones

  validates :fname, :lname, presence: true

  def full_name
    pname.nil? ? "#{fname} #{lname}" : "#{fname} #{pname} #{lname}"
  end
end
