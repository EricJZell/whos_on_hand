class Volunteer < ActiveRecord::Base

  validates :name, presence: true
  validates :mac_address, presence: true

  belongs_to :user

end
