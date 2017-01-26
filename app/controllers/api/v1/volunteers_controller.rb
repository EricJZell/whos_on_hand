class Api::V1::VolunteersController < ApplicationController
  protect_from_forgery except: :report_status
  before_filter :parse_request, :authenticate_user_from_token!

  def report_status
    detected_macs = @payload['detected_macs']
    detected_macs.each do |mac|
      vol = Volunteer.find_by_mac_address(mac)
      if vol
        vol.last_detected = Time.now
        if !vol.save!
          render nothing: true, status: 500
          return
        end
      end
    end
    render json: {processed_mac_addresses: detected_macs}, status: 200
  end

private

   def authenticate_user_from_token!
     if @payload['token'] != "845e2nd"
       render nothing: true, status: :unauthorized
     end
   end

   def parse_request
     @payload = JSON.parse(request.body.read)
   end

end
