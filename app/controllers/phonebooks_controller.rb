class PhonebooksController < ApplicationController
  def index
    @users = User.order(lname: :desc)
  end

  def create; end

  def fill_in
    all_contacts = Kerio::KerioOperator.get_all_contacts

    all_contacts.each do |contact|
      number = contact[:number]
      fname = contact[:fname]
      lname = contact[:lname]
      pname = contact[:pname]

      user = User.find_or_create_by(fname: fname, lname: lname, pname: pname)

      InternalPhone.find_or_create_by(number, user: user)
    end
  end
end
