class Webpage < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_many :servers, through: :visits
  validates :page_name, presence: true
  validate :correct_format

  def correct_format
    unless page_name.chars.first == '/' && page_name.chars.last != '/'
      errors.add(:page_name, "Invalid format")
    end
  end
end
