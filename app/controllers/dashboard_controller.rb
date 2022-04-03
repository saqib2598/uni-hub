# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @universities = University.all.page(params[:page]).per(9)
  end
end
