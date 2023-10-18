class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index read_from_ad]

  def read_from_ad
    ad = ActiveDirectory.new(type: 'Users')
    @users = ad.read.sort_by { |user| user[:name] }
  end
end
