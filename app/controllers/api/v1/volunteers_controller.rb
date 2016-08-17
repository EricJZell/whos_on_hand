class Api::V1::VolunteersController < ApplicationController
  protect_from_forgery except: :report_status

  def report_status
    binding.pry
  end

end
