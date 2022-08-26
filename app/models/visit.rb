class Visit < ApplicationRecord
  belongs_to :webpage
  belongs_to :server
  validates :webpage, :server, presence: true
end
