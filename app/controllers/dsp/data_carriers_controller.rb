module Dsp
  class DataCarriersController < ApplicationController
    def index
      @data_carriers = DataCarrier.order(:carrier_type)
    end

    def new
      @data_carrier = DataCarrier.new
      @users = User.order(:lname)
    end

    def create
      user = User.find_by(id: user_params['user_id'])
      data_carrier = DataCarrier.new(data_carrier_params)
      data_carrier.update_attribute(:user_id, user.id)

      if data_carrier.save
        redirect_to dsp_data_carriers_path
      else
        render 'dsp/data_carriers/new'
      end
    end

    private

    def data_carrier_params
      params.require(:dsp_data_carrier).permit(:carrier_type, :carrier_model, :registration_number)
    end

    def user_params
      params.require(:dsp_data_carrier).permit(:user_id)
    end
  end
end
