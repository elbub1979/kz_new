class PhonebooksController < ApplicationController
  def index
    @users = User.order(lname: :desc)
  end
end
