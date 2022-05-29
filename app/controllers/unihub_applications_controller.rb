# frozen_string_literal: true

class UnihubApplicationsController < ApplicationController
  def new
    @unihub_application = UnihubApplication.new
  end

  def create
    @unihub_application = UnihubApplication.create!(unihub_application_params.except(:country))
    redirect_to root_path
  end

  private

  def unihub_application_params
    params.require(:unihub_application).permit(:current_qualification, :interested_qualification, :country, :course,
                                               :accomodation_required).merge(user_id: current_user.id, status: 0, country_id: users_country)
  end

  def users_country
    @country_id = Country.find_by(name: params[:unihub_application][:country]).id
  end
end
