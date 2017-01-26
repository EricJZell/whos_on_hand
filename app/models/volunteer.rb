class Volunteer < ActiveRecord::Base

  validates :name, presence: true
  validates :mac_address, presence: true

  belongs_to :user

  def readable_last_detected
    if last_detected
      last_detected.strftime("%A, %d %b %Y %l:%M %p")
    else
      "Not yet active"
    end
  end

end
