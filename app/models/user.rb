# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable, :validatable

  has_many :employees
  has_many :departments, through: :employees

  validates :lname, presence: true

  def full_name
    pname.nil? ? "#{lname} #{fname}" : "#{lname} #{fname} #{pname}"
  end

  def hidden?
    hidden
  end

  # разрешить регистрацию без пароля
  def password_required?
    new_record? ? false : super
  end

  def email_required?
    true
  end
end
