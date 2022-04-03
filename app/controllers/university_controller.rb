# frozen_string_literal: true

class UniversityController < ApplicationController
  def show
    @university = University.find(params[:id])
  end
end
