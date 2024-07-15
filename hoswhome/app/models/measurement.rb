class Measurement < ApplicationRecord
  belongs_to :sensor

  validates :value, presence: true

  after_create_commit -> { broadcast_prepend_to self.sensor }

  scope :last_day, ->() { where('created_at > ?', 24.hours.ago).order(created_at: :desc) }
end
