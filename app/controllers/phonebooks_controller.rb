class PhonebooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :fill_in]

  def index
    # @employees = Employee.order(:lname)
    @employees = Employee.all
  end

  def create; end

  def list
    @users = User.includes(:internal_phones).order("#{params[:column]} #{params[:direction]}")
    render partial: 'phonebooks/phone', users: @users
  end

  def fill_in
    all_contacts = Kerio::Operator.get_all_contacts

    all_contacts.each do |contact|
      next if contact.any? { |_, value| value.nil? }

      username = contact[:username]
      email = contact[:email]
      number = contact[:number]
      fname = contact[:fname]
      lname = contact[:lname]
      pname = contact[:pname]


      user = User.create_with(fname: fname, lname: lname, pname: pname, email: email).find_or_create_by!(login: username)
      phone = InternalPhone.find_or_create_by!(number: number)

      # phone.update_attribute(:user, user)
    end
  end
end
