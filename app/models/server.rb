class Server < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_many :webpages, through: :visits
  validates :ip_address, presence: true
end
