class Sensor < ApplicationRecord

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :measurements, dependent: :delete_all

  def to_s
    "#{self.code} - #{self.name}"
  end

end
