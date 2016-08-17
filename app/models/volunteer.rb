class Volunteer < ActiveRecord::Base

  validates :name, presence: true
  validates :ip_address, presence: true

  belongs_to :user

end
