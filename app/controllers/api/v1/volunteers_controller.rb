class Api::V1::VolunteersController < ApplicationController
  protect_from_forgery except: :report_status
  before_filter :parse_request, :authenticate_user_from_token!

  def report_status
    detected_ips = @json['detected_ip_addresses']
    detected_ips.each do |ip|
      vol = Volunteer.find_by_ip_address(ip)
      if vol
        vol.last_detected = Time.now
        if !vol.save!
          render nothing: true, status: 500
          return
        end
      end
    end
    render json: {processed_ip_addresses: detected_ips}, status: 200
  end

private

   def authenticate_user_from_token!
     if @json['token'] != "Hello"
       render nothing: true, status: :unauthorized
     end
   end

   def parse_request
     @json = JSON.parse(request.body.read)
   end

end
