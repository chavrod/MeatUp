class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendance_records, foreign_key: :attended_event_id
  has_many :attendees, through: :attendance_records, source: :event_attendee
end
