# frozen_string_literal: true

class UnihubApplicationsController < ApplicationController
  before_action :filter_params, only: [:create]

  def new
    if current_user.unihub_application.nil?
      @unihub_application = UnihubApplication.new
    else
      flash[:alert] = 'You already have an ongoing application'
      redirect_to root_path
    end
  end

  def create
    unihub_application = UnihubApplication.create!(unihub_application_params.except(:country))
    # UserMailer.new_application_submitted_admin(unihub_application.id).deliver_now if unihub_application.save!

    redirect_to root_path
  end

  private

  def unihub_application_params
    params.require(:unihub_application).permit(:current_qualification, :interested_qualification, :country, :course,
                                               :accomodation_required).merge(user_id: current_user.id, status: 0, country_id: users_country)
  end

  def filter_params
    unihub_application_params[:current_qualification].downcase!
    unihub_application_params[:interested_qualification].downcase!
  end

  def users_country
    @country_id = Country.find_by(name: params[:unihub_application][:country]).id
  end
end
