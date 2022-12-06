# frozen_string_literal: true

class User < ApplicationRecord
  before_save :get_ldap_email

  devise :ldap_authenticatable, :registerable, :recoverable,
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

  private

  def get_ldap_email
    self.email = Devise::LdapAdapter.get_ldap_param(self.username,"mail")
  end


end
