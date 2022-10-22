class InternalPhone < ApplicationRecord
  belongs_to :user

  validates :number, format: { with: /\A\d{3}\z/, message: :wrong_format }, uniqueness: true
end
